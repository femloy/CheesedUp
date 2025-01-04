function ModCharacter(_character, _json, _path) constructor
{
	character = _character;
	name = struct_expect_default(_json, "name", "Unknown");
	path = _path;
	
	default_palette = struct_expect_default(_json, "default_palette", 1);
	color_array = struct_expect_default(_json, "color_array", [1, 2]);
	
	dresser_color_y = struct_expect_default(_json, "dresser_color_y", 1);
	dresser_mixing_color_y = struct_expect_default(_json, "dresser_mixing_color_y", 1);
	
	mixable_palettes = struct_expect_default(_json, "mixable_palettes", []);
	excluded_palettes = struct_expect_default(_json, "excluded_palettes", []);
	
	sprites =
	{
		// {spr_idle: <sprite>}
		player: {},
		hud: {},
		misc: {},
	};
	
	sounds = struct_expect_default(_json, "sounds", {});
	
	sprite_data =
	{
		
	};
	
	sprite_cache = [];
	
	process_sprite = function(sprite_name, file)
	{
		trace("[ModCharacter] Processing sprite ", file);
		
		var data = sprite_data[$ sprite_name];
		if data == undefined
			data = {};
		
		var xo = data[$ "xorigin"];
		var yo = data[$ "yorigin"];
		
		var sprite = sprite_add(file, data[$ "images"] ?? 1, false, false, xo ?? 0, yo ?? 0);
		if !sprite_exists(sprite)
		{
			show_message($"Image \"{file}\" failed to load");
			return noone;
		}
		
		if xo == undefined or yo == undefined
		{
			xo ??= sprite_get_width(sprite) / 2;
			yo ??= sprite_get_height(sprite) / 2;
			sprite_set_offset(sprite, xo, yo);
		}
		
		var spd = data[$ "speed"] ?? 1;
		sprite_set_speed(sprite, spd, spritespeed_framespergameframe);
		
		return sprite;
	}
	
	add_palettes = function()
	{
		var general = get_general();
		with obj_skinchoice
		{
			var wd = sprite_get_width(general.spr_palette);
			if general.default_palette >= wd
			{
				audio_play_sound(sfx_pephurt, 0, false);
				show_message($"{other.name}: Default palette out of bounds ({general.default_palette} >= {wd})");
				
				add_palette(0);
				sel.palette = 0;
			}
			else
			{
				// first palette
				add_palette(general.default_palette).set_prefix("");
				
				// every other
				for(var i = general.default_palette + 1; i < wd; ++i)
				{
					if i == 2 // skip 2
						continue;
					if i == 12
					{
						i += 2; // skip 12, 13 and 14
						continue;
					}
					if array_contains(other.excluded_palettes, i)
						continue;
					
					var p = add_palette(i);
					if array_contains(other.mixable_palettes, i)
						p.set_prefix();
				}
			}
		}
	}
	
	get_general = function()
	{
		return
		{
			char: character,
			spr_idle: sprites.player[$ "spr_idle"] ?? spr_player_idle,
			spr_palette: sprites.player[$ "spr_palette"] ?? spr_peppalette,
			spr_dead: sprites.player[$ "spr_dead"] ?? sprites.player[$ "spr_hurt"] ?? spr_player_dead,
			spr_shirt: sprites.misc[$ "spr_shirt"] ?? spr_palettedresserdebris,
			default_palette: default_palette,
			pattern_color_array: color_array,
			color_index: dresser_color_y,
			mixing_color: dresser_mixing_color_y
		};
	}
	
	apply_player_sprites = function(player)
	{
		if !instance_exists(player)
			exit;
		
		var sprite_names = struct_get_names(sprites.player);
		while array_length(sprite_names)
		{
			var s = array_shift(sprite_names);
			if player[$ s] != undefined or string_starts_with(s, "spr_")
				player[$ s] = sprites.player[$ s];
		}
	}
	
	find_sprites = function(path, struct)
	{
		for (var file = file_find_first(concat(path, "*.png"), 0); file != ""; file = file_find_next())
		{
			var sprite_name = filename_change_ext(file, "");
			var sprite = process_sprite(sprite_name, concat(path, file));
			if sprite_exists(sprite)
			{
				struct[$ sprite_name] = sprite;
				array_push(sprite_cache, sprite);
			}
		}
	}
	
	init = function()
	{
		// sprite data
		var sprite_data_file = scr_load_file(path + "/spritedata.json");
		if sprite_data_file != undefined
			sprite_data = json_parse(sprite_data_file);
		
		// sprites
		find_sprites(path + "/player/", sprites.player);
		find_sprites(path + "/hud/", sprites.hud);
		find_sprites(path + "/misc/", sprites.misc);
		
		// index pal swapper
		if sprites.player[$ "spr_palette"] != undefined
			pal_swap_index_palette(sprites.player.spr_palette);
	}
	
	cleanup = function()
	{
		// fix player
		var player_exists = instance_exists(obj_player);
		instance_activate_object(obj_player);
		
		with obj_player
		{
		    if character == other.character
		    {
		        character = "P";
		        scr_characterspr();
		        sprite_index = spr_idle;
				state = states.normal;
		    }
		}
		
		if !player_exists
		    instance_deactivate_object(obj_player);
		
		// clear sprites
		if sprites.player[$ "spr_palette"] != undefined
			ds_map_delete(global.Pal_Map, sprites.player.spr_palette);
		while array_length(sprite_cache)
			sprite_delete(array_pop(sprite_cache));
	}
}

function scr_modding_character(char)
{
	if !live_enabled return noone;
	
	stored_result = noone;
	array_foreach(global.mods, method({char: char}, function(_mod)
	{
		if _mod.enabled && _mod.characters[$ char] != undefined
			stored_result = _mod.characters[$ char];
	}));
	
	return stored_result;
}
