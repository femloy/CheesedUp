/// @description create layers

live_auto_call;

global.door_index = 0;
global.door_sprite = spr_door;

global.in_cyop = true;
ds_list_clear(global.cyop_broken_tiles);

// clean up
with obj_persistent
{
	room_tiles = [];
	room_bgs = [];
}

with obj_player
{
	var dont = true;
	with obj_doorX
	{
		if targetDoor == other.targetDoor
		{
			dont = false;
			break;
		}
	}
	if !dont
		x = -1000;
}

try
{
	// add instances
	var _room = global.cyop_rooms[room_ind][1];
	
	var prop = _room.properties;
	for(var i = 0, n = array_length(_room.instances); i < n; ++i)
	{
		var inst_data = _room.instances[i];
		if inst_data.deleted
			continue;
		
		var layer_name = $"Instances_{inst_data.layer}", lay;
		if !layer_exists(layer_name)
			lay = layer_create(-1 - inst_data.layer, layer_name);
		else
			lay = layer_get_id(layer_name);
		
		// figure out object
		var asset_name = cyop_get_object(inst_data.object);
		if asset_name == noone
		{
			if is_string(inst_data.object)
				asset_name = inst_data.object;
			else
			{
				cyop_error_exit("This tower is incompatible, because it was made using a mod that adds extra objects, or it's just corrupted.");
				exit;
			}
		}
		
		var objindex = asset_name;
		switch objindex
		{
			case "obj_teleporter_receptor": objindex = obj_teleporter; break;
			case "obj_pizzasona_spawn": objindex = obj_bigcollect; break;
			case "obj_warp_number": objindex = obj_doorX; break;
			case "obj_bigcollectarena": objindex = obj_bigcollect; break;
			case "obj_collectarena": objindex = obj_collect; break;
			case "obj_playersprcontroller": objindex = obj_null; break;
			
			case obj_roomname:
				global.roommessage = inst_data.variables[$ "msg"];
				continue;
			
			default:
				if is_string(objindex)
				{
					var guess;
					if is_string(inst_data.object)
						guess = $"Object Name: \"{asset_name}\"";
					else
						guess = $"Old AFOM Object Name: \"{asset_name}\"";
					cyop_error_exit($"This tower is incompatible, because it uses one of those CYOP fixed objects mods.\n{guess}\n\nThis is being worked on.");
					exit;
				}
				break;
		}
		
		// add instance
		var inst = instance_create_layer(floor(inst_data.variables.x - prop.roomX), floor(inst_data.variables.y - prop.roomY), lay, objindex);
		if instance_exists(inst) // sometimes it fucking doesn't
		{
			inst.targetRoom = "main";
			switch asset_name
			{
				case "obj_playersprcontroller":
					inst.sprite_index = spr_player_idle;
					inst.visible = false;
					break;
				
				case "obj_teleporter_receptor":
					inst.start = false;
					break;
				
				case "obj_pizzasona_spawn":
					if in_saveroom(inst)
						break;
					
					inst.visible = false;
					inst.value = 150;
				
					with instance_create(inst.x, inst.y - 42, obj_pizzasonacollect)
						collectID = inst.id;
					break;
				
				case "obj_collectarena":
				case "obj_bigcollectarena":
					inst.arena = true;
					break;
			}
		
			var struct = inst_data.variables;
			var varNames = variable_struct_get_names(struct);
			
			for (var j = 0; j < array_length(varNames); j++)
			{
				if varNames[j] == "trigger" && objindex == obj_doorX
					inst.door = struct.trigger;
				else if asset_name == "obj_playersprcontroller"
				{
					if string_starts_with(varNames[j], "spr_")
					{
						with obj_player
							self[$ varNames[j]] = cyop_resolvevalue(struct[$ varNames[j]], varNames[j]);
					}
				}
				else if varNames[j] != "x" && varNames[j] != "y" && varNames[j] != "cyop" && varNames[j] != "afom"
					inst[$ varNames[j]] = cyop_resolvevalue(struct[$ varNames[j]], varNames[j]);
			}
			if struct[$ "useLayerDepth"] != undefined
				array_push(forced_layers, [inst, lay]);
			
			// level name
			if (objindex == obj_startgate or objindex == obj_bossdoor) && REMIX
			{
				var ini = concat(global.cyop_path, "/levels/", inst.levelName, "/level.ini");
				if file_exists(ini)
				{
					ini_open(ini);
					var name = ini_read_string("data", "name", "");
					if name != "Level Name"
						inst.msg = name;
					ini_close();
				}
			}
			
			if safe_get(inst, "flipX")
			{
				if sprite_exists(inst.sprite_index)
				{
					var horDifference = sprite_get_width(inst.sprite_index) - (sprite_get_xoffset(inst.sprite_index) * 2);
			        inst.x += horDifference * inst.image_xscale;
				}
		        inst.image_xscale *= -1;
			}
			if safe_get(inst, "flipY")
			{
				if sprite_exists(inst.sprite_index)
				{
					var verDifference = sprite_get_height(inst.sprite_index) - (sprite_get_yoffset(inst.sprite_index) * 2);
			        inst.y += verDifference * inst.image_yscale;
				}
		        inst.image_yscale *= -1;
			}
			
			// noise stuff
			if obj_player1.character == "N"
			{
				if sprite_index == spr_peppinotvstreet or sprite_index == spr_gustavotvstreet
				{
					sprite_index = spr_noisetvstreet;
					x += 50;
					y += 50;
				}
			}
		
			// saveroom
			if struct_exists(inst_data, "ID")
				inst.ID = inst_data.ID;
			else
				struct_set(inst_data, "ID", inst.id);
		}
		else
			trace("Instance of object ", asset_name, " deleted itself upon create");
	}

	// backgrounds
	var backgrounds = variable_struct_get_names(_room.backgrounds);
	for(var i = 0, n = array_length(backgrounds); i < n; ++i)
	{
		var bg_data = _room.backgrounds[$ backgrounds[i]];
		
		var layer_num = real(backgrounds[i]);
		if layer_num < 0
			var lay = layer_create(-(500 + (10 * layer_num)));
		else
			var lay = layer_create(500 + (10 * layer_num));
		
		var sprite = cyop_resolvevalue(bg_data.panic_sprite != -1 && global.panic ? bg_data.panic_sprite : bg_data.sprite, "sprite_index");
		var bg = layer_background_create(lay, sprite);
		layer_background_speed(bg, bg_data.image_speed);
		layer_background_htiled(bg, bg_data.tile_x);
		layer_background_vtiled(bg, bg_data.tile_y);
		layer_hspeed(lay, bg_data.hspeed);
		layer_vspeed(lay, bg_data.vspeed);
		
		var xx = bg_data.x, yy = bg_data.y;
		xx -= sprite_get_xoffset(sprite);
		yy -= sprite_get_yoffset(sprite);
		
		with obj_persistent
		{
			array_push(room_bgs, {
				layer_id: lay,
				layer_name: concat("Backgrounds_", i),
				x: xx,
				y: yy,
				bg_id: bg,
				bg_sprite: layer_background_get_sprite(bg),
				par_x: 1 - bg_data.scroll_x,
				par_y: 1 - bg_data.scroll_y
			});
		}
	}
	with obj_persistent
	{
		array_sort(room_bgs, function(a, b) {
			return layer_get_depth(b.layer_id) - layer_get_depth(a.layer_id);
		});
	}

	// tiles
	//placed_tile = false;
	
	var tile_layers = variable_struct_get_names(_room.tile_data);
	var f = method({room_x: _room.properties.roomX, room_y: _room.properties.roomY, _room: _room}, function(this, i)
	{
		var tilelayer_data = _room.tile_data[$ this];
		
		var tiles = variable_struct_get_names(tilelayer_data);
		if !array_length(tiles)
			exit;
		
		var layer_num = real(this);
		if layer_num >= 0
			var depp = 5 * layer_num;
		else
			var depp = -100 + layer_num;
		
		var layer_name = $"Tiles_{layer_num}";
		if !layer_exists(layer_name)
			var lay = layer_create(depp, layer_name);
		else
			lay = layer_get_id(layer_name);
		
		var secret = layer_num <= -5;
		var tilelayer = new cyop_tilelayer(-room_x, -room_y, tilelayer_data, depp, secret);
		
		//obj_cyop_loader.placed_tile = true;
		
		// saveroom
		var inst = instance_create_layer(0, 0, lay, obj_cyop_tilelayer, {tilelayer: tilelayer, secrettile: secret});
		if secret
		{
			if struct_exists(tilelayer_data, "ID")
				inst.ID = tilelayer_data.ID;
			else
				struct_set(tilelayer_data, "ID", inst.id);
			
			if in_saveroom(inst.id)
				inst.revealed = true;
		}
	});
	array_foreach(tile_layers, f, 0, infinity);
	
	//global.showcollisions = !placed_tile or instance_exists(obj_treasure);
	
	// song
	var song = _room.properties.song;
	var fadeMS = real(_room.properties.songTransitionTime);
	var fade = fadeMS <= 0 ? 1 : (1 / ((fadeMS / 1000) * room_speed));

	if !global.panic or obj_music.secret
	{
		with obj_music
		{
			var found = cyop_add_song(song, fade);
			cyop_switch_song(found, fade);
		}
	}
	
	// AFOM specific
	if global.in_afom
		global.combotimepause = prop[$ "pausecombo"] ?? 0;
	
	// do it asshole
	with obj_roomname
		ds_list_clear(seen_rooms);
	with all
	 	event_perform(ev_other, ev_room_start);
	scr_panicbg_init();
}
catch (e)
{
	if !is_struct(e)
		cyop_error_exit($"Unable to load room \"{obj_cyop_loader.room_name}\"!\n\n---\n\n{e}\n\n---");
	else
		cyop_error_exit($"Unable to load room \"{obj_cyop_loader.room_name}\"!\n\n---\n\n{e.longMessage}\n---\n\nstacktrace: {e.stacktrace}\n\n---");
}

if instance_exists(obj_trash)
	instance_create_unique(0, 0, obj_surfback);
