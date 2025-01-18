if !YYC
	message = "don't steal my code shithead";

global.in_cyop = false;
global.in_afom = false;
global.cyop_rooms = []; // [[runtime_room_index, json]]
global.cyop_audio = -1; // ds_map
global.cyop_sprites = -1; // ds_map
global.cyop_tiles = -1; // ds_map
global.cyop_room_map = -1; // ds_map
global.cyop_asset_cache = -1; // ds_map
global.cyop_fill = 4000;
global.cyop_path = "";
global.cyop_hub_level = "";
global.cyop_level_name = "";
global.cyop_tower_name = "";
global.cyop_is_hub = false;
global.afom_wfixed = false;
global.afom_secrets = 0;
global.afom_lapmode = LAP_MODES.normal;
global.afom_noiseupdate = false;

function cyop_cleanup()
{
	if live_call() return live_result;
	
	global.in_cyop = false;
	global.in_afom = false;
	global.cyop_is_hub = false;
	global.cyop_level_name = "";
	global.cyop_tower_name = "";
	cyop_freemusic();
	
	// sprites
	var i = ds_map_find_first(global.cyop_sprites);
	while !is_undefined(i)
	{
		if sprite_exists(global.cyop_sprites[?i])
			sprite_delete(global.cyop_sprites[?i]);
		i = ds_map_find_next(global.cyop_sprites, i);
	}
	ds_map_clear(global.cyop_sprites);
	ds_map_clear(global.cyop_tiles);
	
	// audio
	audio_stop_all();
	
	var i = ds_map_find_first(global.cyop_audio);
	while !is_undefined(i)
	{
		if audio_exists(global.cyop_audio[?i])
			audio_destroy_stream(global.cyop_audio[?i]);
		i = ds_map_find_next(global.cyop_audio, i);
	}
	ds_map_clear(global.cyop_audio);
	
	// etc
	with obj_cyop_tilelayer
		instance_destroy();
	ds_map_clear(global.cyop_room_map);
	ds_map_clear(global.cyop_asset_cache);
	ds_list_clear(global.cyop_broken_tiles);
	
	with obj_player
		scr_characterspr();
}
function cyop_asset(str)
{
	if live_call(str) return live_result;
	
	var find = global.cyop_asset_cache[?str];
	if !is_undefined(find)
		return find;
	else
	{
		var store = asset_get_index(str);
		ds_map_add(global.cyop_asset_cache, str, store);
		return store;
	}
}
function cyop_load(ini)
{
	if live_call(ini) return live_result;
	
	gamesave_async_save();
	/*with obj_player
	{
		state = states.door;
		sprite_index = spr_lookdoor;
		image_index = image_number - 1;
	}*/
	with instance_create(0, 0, obj_loadingscreen)
	{
		cyop_tower = ini;
		cyop_changesave = true;
		scr_pause_activate_objects(false);
	}
}
function cyop_load_internal(ini)
{
	if live_call(ini) return live_result;
	
	// load ini
	if !file_exists(ini)
		return "The INI file doesn't exist.";
	
	ini_open(ini);
	var type = ini_read_real("properties", "type", 0); // 0 - tower, 1 - level
	global.cyop_tower_name = ini_read_string("properties", "name", "");
	var mainlevel = ini_read_string("properties", "mainlevel", "");
	ini_close();
	
	// target level
	global.cyop_path = filename_dir(ini);
	
	var targetLevel = concat(global.cyop_path, "/levels/", mainlevel, "/level.ini");
	if !file_exists(targetLevel)
		return "This tower has no Main Level.";
	
	var loader = instance_create_unique(0, 0, obj_cyop_assetloader);
	recursive_func = function(folder, prefix)
	{
		if directory_exists(folder)
		{
			// files
			var recursion = [];
			
			var file = file_find_first(concat(folder, "/*"), fa_directory);
			while file != ""
			{
				if directory_exists(concat(folder, "/", file))
					array_push(recursion, file);
				else
				{
					var ext = string_lower(filename_ext(file));
					var filename = string_replace(file, ext, ""); // image
					var filepath = concat(folder, "/", file); // c:/path/image.png
					
					#region SPRITE
					
					if ext == ".png"
					{
						// properties
						ini_open(filename_change_ext(filepath, ".ini"));
						var images = ini_read_real("properties", "images", 0);
						var image_width = ini_read_real("properties", "image_width", 0);
					
						var centered = ini_read_real("offset", "centered", false);
						var x_offset = ini_read_real("offset", "x", 0);
						var y_offset = ini_read_real("offset", "y", 0);
					
						var tileset_size = ini_read_real("tileset", "size", 0);
						ini_close();
						
						// add sprite
						var wd = 0;
						if image_width != 0 or centered
							wd = image_get_width(filepath);
						if image_width != 0
							images = floor(wd / image_width);
						
						// sprite_add_ext is apparently very unstable...
						/*
						var spr = sprite_add_ext(filepath, images == 0 ? 1 : images, x_offset, y_offset, false);
						trace($"--- Loading sprite: {spr}\nFilepath: {filepath}\nImages: {images} Image_width: {image_width}");
						ds_list_add(obj_cyop_assetloader.to_load, spr);
						*/
						
						// Old method
						var spr = sprite_add(filepath, images == 0 ? 1 : images, false, false, 0, 0);
						if sprite_exists(spr)
						{
							sprite_set_speed(spr, 1, spritespeed_framespergameframe);
							
							if centered
							{
								x_offset += sprite_get_width(spr) / 2;
								y_offset += sprite_get_height(spr) / 2;
							}
							sprite_set_offset(spr, x_offset, y_offset);
							
							// add to map(s)
							ds_map_add(global.cyop_sprites, prefix + filename, spr);
							if tileset_size > 0
								ds_map_add(global.cyop_tiles, prefix + filename, [spr, tileset_size]);
						}
						else
							trace("Failed to load sprite ", filepath);
					}
					
					#endregion
					#region AUDIO
					
					if ext == ".ogg"
					{
						// properties
						ini_open(concat(folder, "/", filename, ".ini"));
						var loop_start = ini_read_real("loopPoints", "start", 0);
						var loop_end = ini_read_real("loopPoints", "end", 0);
						ini_close();
					
						// add sound
						var snd = audio_create_stream(filepath);
						if loop_start > 0
							audio_sound_loop_start(snd, loop_start);
						if loop_end > 0
							audio_sound_loop_end(snd, loop_end);
						
						ds_map_add(global.cyop_audio, prefix + filename, snd);
					}
					
					#endregion
				}
				file = file_find_next();
			}
			file_find_close();
			
			// look through subfolders
			while array_length(recursion) > 0
			{
				var bwah = array_pop(recursion);
				recursive_func(concat(folder, "/", bwah), prefix + concat(bwah, "/"));
			}
		}
	}
	
	// load sprites and audio
	recursive_func(concat(filename_path(ini), "sprites"), "");
	recursive_func(concat(filename_path(ini), "audio"), "");
	if global.cyop_assets_folder != noone
		recursive_func(global.cyop_assets_folder, "");
	
	// if we're somehow done loading
	loader.wait();
	
	// load into the main level
	if type == 0
		global.cyop_hub_level = targetLevel;
	else
		global.cyop_hub_level = "";
	
	return cyop_load_level_internal(targetLevel);
}
function cyop_load_level(ini)
{
	if live_call(ini) return live_result;
	
	with instance_create(0, 0, obj_loadingscreen)
	{
		cyop_level = ini;
		cyop_changesave = true; // for single level towers, only called from menu
		scr_pause_activate_objects(false);
	}
}
function cyop_read_level_ini(ini)
{
	if live_call(ini) return live_result;
	
	ini_open(ini);
	var s = {
		ini: ini,
		
		level: filename_name(filename_dir(ini)),
		isWorld: ini_read_real("data", "isWorld", false),
		pscore: ini_read_real("data", "pscore", 8000),
		name: ini_read_string("data", "name", ""),
		escape: ini_read_real("data", "escape", 4000),
		
		titlecardSprite: ini_read_string("data", "titlecardSprite", "no titlecard"),
		titleSprite: ini_read_string("data", "titleSprite", ""),
		titleSong: ini_read_string("data", "titleSong", ""),
		
		// AFOM 2.0
		escapeSong: ini_read_string("data", "escapeSong", ""),
		lap2Song: ini_read_string("data", "lap2Song", ""),
		lap3Song: ini_read_string("data", "lap3Song", ""),
		lap4Song: ini_read_string("data", "lap4Song", ""),
		
		escapeSongN: ini_read_string("data", "escapeSongN", ""),
		lap2SongN: ini_read_string("data", "lap2SongN", ""),
		lap3SongN: ini_read_string("data", "lap3SongN", ""),
		lap4SongN: ini_read_string("data", "lap4SongN", ""),
		
		escapePlay: ini_read_string("data", "escapePlay", "true"),
		titleSongN: ini_read_string("data", "titleSongN", ""),
	};
	ini_close();
	return s;
}
function cyop_load_level_internal(ini, travel = false)
{
	//if live_call(ini, travel) return live_result;
	// crashes for some reason
	
	if !file_exists(ini)
		return "INI doesn't exist";
	
	// load ini
	var ini_struct = cyop_read_level_ini(ini);
	global.cyop_is_hub = ini_struct.isWorld;
	global.srank = ini_struct.pscore;
	global.cyop_level_name = ini_struct.name;
	global.cyop_fill = ini_struct.escape;
	
	// rooms folder
	var rooms_path = concat(filename_path(ini), "rooms");
	if !directory_exists(rooms_path)
		return "Rooms folder doesn't exist";
	
	try
	{
		ds_map_clear(global.cyop_room_map);
		var version_warned = obj_cyop_loader.seen_warning;
		
		global.afom_wfixed = false;
		global.afom_secrets = 0;
		global.afom_lapmode = LAP_MODES.normal;
		
		// loop through jsons
		var room_file = file_find_first(concat(rooms_path, "/*.json"), fa_none);
		for(var r = 0; room_file != ""; room_file = file_find_next())
		{
			var room_name = filename_change_ext(room_file, "");
			if file_exists(concat(rooms_path, "/", room_name, "_wfixed.json"))
			{
				global.afom_wfixed = true;
				global.in_afom = true;
				continue;
			}
			trace("Loading room: ", room_file);
			
			var json = json_parse(scr_load_file(concat(rooms_path, "/", room_file)));
			json = cyop_version_compatibility(json);
			
			// version mismatch
			if json.editorVersion > 5
			{
				if json[$ "isNoiseUpdate"]
					global.in_afom = true;
				else if !version_warned
				{
					show_message(embed_value_string(lstr("cyop_version_mismatch"), [json.editorVersion]));
					version_warned = true;
				}
			}
			
			/*
			if global.in_afom && !version_warned
			{
				show_message(lstr("cyop_version_mismatch_afom"));
				version_warned = true;
			}
			*/
			
			if version_warned
				obj_cyop_loader.seen_warning = true;
			
			// load room
			if array_length(global.cyop_rooms) > r
			{
				var _room = global.cyop_rooms[r][0];
				room_assign(_room, custom_room_parent);
				global.cyop_rooms[r] = [_room, json, "fix this"];
			}
			else
			{
				var _room = room_add();
				room_assign(_room, custom_room_parent);
				array_push(global.cyop_rooms, [_room, json, "fix this"]);
			}
			ds_map_add(global.cyop_room_map, room_name, r);
			
			// properties
			var prop = json.properties;
			var wd = prop.levelWidth - prop.roomX, ht = prop.levelHeight - prop.roomY;
			
			room_set_width(_room, prop.levelWidth - prop.roomX);
			room_set_height(_room, prop.levelHeight - prop.roomY);
			room_set_camera(_room, 0, camera_create_view(0, 0, wd, ht));
			
			if prop[$ "pausecombo"] != undefined
				global.in_afom = true;
			
			for (var i = 0; i < array_length(json.instances); i++)
	        {
				var this = json.instances[i];
				if this[$ "deleted"]
					continue;
				
				var object = cyop_get_object(this[$ "object"]);
				if object == noone
					continue;
				
				switch object
				{
					// AFOM: count secrets
					case obj_afom_secretroomtrigger:
						global.afom_secrets++;
						break;
					case obj_secretportal:
						var vars = this[$ "variables"];
						if vars[$ "visible"] == 0 or vars[$ "visible"] == false
							break;
						if vars[$ "secret"] != "true"
							break;
						global.afom_secrets++;
						break;
					
					// fucking idiots
					case obj_startgate:
						reset_modifier();
						
						global.cyop_is_hub = true;
						global.cyop_hub_level = ini;
						break;
				}
			}
			++r;
		}
		file_find_close();
	}
	catch(e)
	{
		trace(e);
		
		// clean
		ds_map_clear(global.cyop_room_map);
		file_find_close();
		
		return "Error loading rooms";
	}
	trace("Done loading rooms");
	
	// load in
	if global.cyop_is_hub
		global.leveltorestart = noone;
	else
		global.leveltorestart = "main";
	global.leveltosave = $"cyop_{string_lower(ini_struct.level)}";
	
	if !travel
		cyop_enterlevel(false, ini_struct);
}
function cyop_enterlevel(gate, ini_struct)
{
	if live_call(gate, ini_struct) return live_result;
	
	global.cyop_is_hub = ini_struct.isWorld;
	if ini_struct.level == global.cyop_hub_level
		global.cyop_is_hub = true;
	
	var reset = global.levelreset;
	global.levelreset = false;
	
	//scr_playerreset(false, true);
	with obj_player1
	{
		state = -1;
		if !reset
		{
			backtohubstartx = x;
			backtohubstarty = y;
			targetDoor = "A";
		}
		else
			targetDoor = "HUB";
		targetRoom = "main";
	}
	
	var titlecardSprite = ini_struct.titlecardSprite;
	var titleSprite = ini_struct.titleSprite;
	var titleSong = ini_struct.titleSong;
	var titleSongN = ini_struct.titleSongN;
	var noiseHeads = noone;
	
	if titlecardSprite != "no titlecard"
	{
		titlecardSprite = (global.cyop_base_sprites[? titlecardSprite] ?? global.cyop_sprites[? titlecardSprite]) ?? spr_null;
		titleSprite = (global.cyop_base_sprites[? titleSprite] ?? global.cyop_sprites[? titleSprite]) ?? spr_null;
		
		titleSong = global.cyop_audio[? titleSong] ?? noone;
		titleSongN = global.cyop_audio[? titleSongN] ?? noone;
		
		if obj_player1.character == "N" && titleSongN != noone
			titleSong = titleSongN;
		
		// AFOM 2.0 noise heads
		try
		{
			noiseHeads = json_parse(scr_load_file(string_replace(ini_struct.ini, "level.ini", "noiseHeads.json")));
		}
		catch (e)
		{
			// do nothing
		}
	}
	
	if !global.cyop_is_hub && titlecardSprite != spr_null && !is_string(titlecardSprite)
	{
		//if !instance_exists(obj_cyop_assetloader) or gate
		{
			with instance_create(0, 0, obj_titlecard)
			{
				titlecard_sprite = titlecardSprite;
				titlecard_index = 0;
				title_index = 0;
				title_sprite = titleSprite;
				title_music = titleSong;
				afom_noisehead = noiseHeads;
				
				if gate
					cyop_level = ini_struct.ini;
			}
		}
		/*
		else
		{
			with obj_cyop_assetloader
			{
				done_func = method({titlecardSprite: titlecardSprite, titleSprite: titleSprite, titleSong: titleSong}, function()
				{
					obj_cyop_assetloader.titlecard = noone;
					obj_cyop_assetloader.done_func = noone;
				
					with instance_create(0, 0, obj_titlecard)
					{
						titlecard_sprite = other.titlecardSprite;
						titlecard_index = 0;
						title_index = 0;
						title_sprite = other.titleSprite;
						title_music = other.titleSong;
					}
				});
				titlecard = titlecardSprite;
				trace($"Titlecard: {titlecard}");
				
				wait();
			}
		}
		*/
	}
	else
	{
		//if !instance_exists(obj_cyop_assetloader) or gate
		{
			with instance_create(0, 0, obj_fadeout)
			{
				restarttimer = true;
				if gate
					cyop_level = ini_struct.ini;
			}
		}
		/*
		else
		{
			with obj_cyop_assetloader
			{
				done_func = function() {
					instance_create(0, 0, obj_fadeout);
				}
				wait();
			}
		}
		*/
	}
}
function cyop_resolvevalue(value, var_name)
{
	if live_call(value, var_name) return live_result;
	
	if var_name == "level" or var_name == "levelName" or var_name == "targetRoom"
		return value;
	if var_name == "grav" or var_name == "vsp" // fuck you other tower
		return real(value);
	
	if is_string(value)
	{
		var cyop_object = cyop_get_object_from_string(value);
		if cyop_object != noone
			return cyop_object;
		
		if var_name == "sound" or var_name == "title_music"
			return global.cyop_audio[? value] ?? value;
		
		if !is_undefined(global.cyop_base_sprites[? value])
			return global.cyop_base_sprites[? value];
		if !is_undefined(global.cyop_sprites[? value])
			return global.cyop_sprites[? value];
		
		if string_pos("\"", value) != 0
            return string_replace_all(value, "\"", "");
        switch value
        {
            case "true": return true;
            case "false": return false;
        }
	}
	
	if (var_name == "sprite_index" or var_name == "mask_index" or var_name == "spr_palette")
	&& !((is_handle(value) or is_real(value)) && sprite_exists(value))
		return spr_blanksprite;
	return value;
}
function cyop_room_goto(str)
{
	if live_call(str) return live_result;
	
	if is_string(str)
	{
		var r = undefined;
		if global.afom_wfixed
			r = global.cyop_room_map[? str + "_wfixed"] ?? global.cyop_room_map[? str];
		else
			r = global.cyop_room_map[? str];
		
		if is_undefined(r)
		{
			cyop_error_exit($"Custom room {str} doesn't exist.");
			exit;
		}
	}
	else
	{
		// please, avoid this.
		var f = ds_map_find_first(global.cyop_room_map);
		while f != undefined
		{
			var r = global.cyop_room_map[? f];
			if global.cyop_rooms[r][0] == str
				break;
			f = ds_map_find_next(global.cyop_room_map, f);
		}
		if f == undefined
		{
			room_goto(str);
			exit;
		}
		else
			str = f;
		
		trace($"[CYOP] Used actual index instead of room name for \"{str}\"");
	}
    
    hash = global.cyop_rooms[r][2];
    
	room_goto(global.cyop_rooms[r][0]);
	with obj_cyop_loader
	{
		alarm[0] = 1;
		_room = global.cyop_rooms[r][1];
		room_name = str;
		room_ind = r;
	}
}
function cyop_error_exit(msg = "Something happened")
{
	audio_stop_all();
	audio_play_sound(sfx_pephurt, 0, false);
	show_message($"{msg}\n\nTower name: {global.cyop_tower_name}\nTower ID: {filename_name(global.cyop_path)}");
	
	with obj_pause
	{
		hub = false;
		event_perform(ev_alarm, 3);
	}
	return false;
}
function cyop_version_compatibility(d)
{
	if live_call(d) return live_result;
	
    var editorVer = d[$ "editorVersion"] ?? 0;
	
	// VERSION ? - { "1": {}, "2": {} } used to be normal array
	if is_array(d.backgrounds)
        d.backgrounds = {};
	
	// VERSION 0 - missing bg hspeed and vspeed
	if editorVer <= 0
	{
		var bgs = variable_struct_get_names(d.backgrounds);
        for (var i = 0; i < array_length(bgs); i++)
        {
			d.backgrounds[$ bgs[i]].hspeed ??= 0;
			d.backgrounds[$ bgs[i]].vspeed ??= 0;
        }
	}
	
	// VERSION 1 - missing song
	if editorVer <= 1
		d.properties.song = "";
	
	// VERSION 2 - missing songTransitionTime
	if editorVer <= 2
		d.properties.songTransitionTime = 100;
	
	// VERSION 3 - bgs missing image_speed and panic_sprite
	if editorVer <= 3
	{
		var bgs = variable_struct_get_names(d.backgrounds);
	    for (var i = 0; i < array_length(bgs); i++)
	    {
			d.backgrounds[$ bgs[i]].image_speed ??= 15;
			d.backgrounds[$ bgs[i]].panic_sprite ??= -1;
	    }
	}
	
	// VERSION 4 - remove offgrid tiles
	if editorVer <= 4
	{
		var ls = struct_get_names(d.tile_data);
	    for (var l = 0; l < array_length(ls); l++)
	    {
	        var lay = struct_get(d.tile_data, ls[l]);
	        var tiles = struct_get_names(lay);
			
	        for (var i = 0; i < array_length(tiles); i++)
	        {
	            var pos = string_split(tiles[i], "_", true, 1);
	            if abs(real(pos[0])) % 32 != 0 or abs(real(pos[1])) % 32 != 0
					struct_remove(lay, tiles[i]);
	        }
	    }
	}
	
    return d;
}
function cyop_instance_create(x, y, object_array)
{
	// new afom feature you can put objects in baddiespawners with preset variables
	// looks like [ object, { var1: value }, { var2: value }, ... ]
	if live_call(x, y, object_array) return live_result;
	
	var oix = cyop_get_object(object_array);
	if oix == noone or is_string(oix)
	{
		cyop_missing_object_error(oix);
		return noone;
	}
	
	if is_array(object_array)
	{
		var inst = instance_create(x, y, oix);
		for(var i = 1; i < array_length(object_array); i++)
		{
			var vars = struct_get_names(object_array[i]);
			for(var j = 0; j < array_length(vars); j++)
				inst[$ vars[j]] = cyop_resolvevalue(object_array[i][$ vars[j]], vars[j]);
		}
		with inst
			cyop_fix_object();
		return inst;
	}
	else
		return instance_create(x, y, oix);
}
function cyop_get_object_from_string(obj)
{
	var map = global.afom_objectmap[? obj];
	if map != undefined
		return map;
	if asset_get_type(obj) == asset_object
		return asset_get_index(obj);
	return noone;
}
function cyop_get_object(obj)
{
	if is_handle(obj)
		return obj;
	if is_string(obj)
		return cyop_get_object_from_string(obj);
	if is_array(obj)
		return cyop_get_object(obj[0]);
	if is_real(obj)
	{
		message = "FUCK YOU SO MUCH AFOM FUCK YOU FUCK YOU FUUUUUUCK";
		var list = global.afom_noiseupdate ? global.afom_objectlist : global.cyop_objectlist;
		if obj < array_length(list) && obj >= 0
			return list[obj];
	}
	return noone;
}
function cyop_object_exists(obj)
{
	if live_call(obj) return live_result;
	
	return cyop_get_object(obj) != noone;
}
function cyop_fix_object()
{
	if live_call() return live_result;
	
	if object_is_ancestor(object_index, obj_baddie)
	{
		while place_meeting(x, y, obj_solid)
		    y--;
		
		if paletteselect != 0
		{
			basepal = paletteselect;
			elitepal = paletteselect;
		}
	}
}
function cyop_missing_object_error(object_name)
{
	lang_error($"Missing object {object_name}");
}
