#macro lstr lang_get_value_newline
#macro lspr lang_get_sprite
#macro lfnt lang_get_font

function scr_get_languages()
{
	global.lang_map = ds_map_create();
	global.lang_sprite_map = ds_map_create();
	global.lang_offload = noone;
	
	if !variable_global_exists("lang")
		global.lang = "en";
	
	// languages
	var root = exe_folder + "data/lang/";
	for (var file = file_find_first(concat(root, "*.txt"), 0); file != ""; file = file_find_next())
		var key = lang_parse_file(concat(root, file));
	file_find_close();
	
	// sprites
	var key = ds_map_find_first(global.lang_map);
	while !is_undefined(key)
	{
		if lang_has_graphics(key)
			lang_sprites_preload(key);
		key = ds_map_find_next(global.lang_map, key);
	}
	
	global.credits_arr = scr_lang_get_credits();
	global.noisecredits_arr = scr_lang_get_noise_credits();
}

function lang_parse_file(filename)
{
	var str = buffer_load(filename);
	var key = lang_parse(buffer_read(str, buffer_text)); // key = "en"
	buffer_delete(str);
	return key;
}

function scr_lang_get_file_arr(filename)
{
	var fo = file_text_open_read(filename);
	var arr = [];
	while fo != -1 && !file_text_eof(fo)
	{
		array_push(arr, file_text_read_string(fo));
		file_text_readln(fo);
	}
	file_text_close(fo);
	return arr;
}

function scr_lang_get_credits()
{
	return scr_lang_get_file_arr("data/credits.txt");
}

function scr_lang_get_noise_credits()
{
	var arr = scr_lang_get_file_arr("data/noisecredits.txt");
	var credits = [];
	for (var i = 0; i < array_length(arr); i++)
	{
		var _name = arr[i++];
		var _heads = array_create(0);
		for (var _head = arr[i++]; _head != ""; _head = arr[i++])
		{
			array_push(_heads, real(_head) - 1);
			if i >= array_length(arr)
				break;
		}
		i--;
		array_push(credits, 
		{
			name: _name,
			heads: _heads
		});
	}
	return credits;
}

function lang_get_value_raw(lang, entry)
{
	var result = undefined;
	
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var this_mod = global.mods[i];
		if !this_mod.enabled
			continue;
		
		if is_undefined(result) && !is_undefined(this_mod.lang_map[? lang])
			result = this_mod.lang_map[? lang][? entry];
		
		if is_undefined(result) && !is_undefined(this_mod.lang_map[? "en"])
			result = this_mod.lang_map[? "en"][? entry];
	}
	
	if is_undefined(result)
		result = global.lang_map[? lang][? entry];
	
	if is_undefined(result)
		result = global.lang_map[? "en"][? entry];
	
	return result;
}

function lang_get_value_newline_raw(lang, entry)
{
	var s = lang_get_value_raw(lang, entry) ?? entry;
	return string_replace_all(s, "\\n", "\n");
}

function lang_get_value(entry)
{
	return lang_get_value_raw(global.lang, entry) ?? entry;
}

function lang_get_value_newline(entry)
{
	return string_replace_all(lang_get_value(entry), "\\n", "\n");
}

function lang_parse(langstring) // langstring being the entire file in a single string
{
	var list = ds_list_create();
	lang_lexer(list, langstring);
	
	var map = lang_exec(list);
	var lang = map[? "lang"];
	
	if ds_map_exists(global.lang_map, lang)
		lang_exec(list, global.lang_map[? lang]);
	else
		ds_map_set(global.lang_map, lang, map);
	
	ds_list_destroy(list);
	return lang;
}

enum lexer
{
	set,
	name,
	value,
	keyword,
	eof
}

function lang_lexer(list, str)
{
	var len = string_length(str);
	var pos = 1;
	while pos <= len
	{
		var start = pos;
		var char = string_ord_at(str, pos);
		pos += 1;
		
		switch (char)
		{
			case ord(" "):
			case ord("	"): // horizontal tab
			case ord("\r"): // carriage return
			case ord("\n"): // newline
				break;
			
			case ord("#"):
				while pos <= len
				{
					char = string_ord_at(str, pos);
					if char == ord("\r") || char == ord("\n")
						break;
					pos += 1;
				}
				break;
			
			case ord("="):
				ds_list_add(list, [lexer.set, start]);
				break;
			
			case ord("\""):
				while pos <= len
				{
					char = string_ord_at(str, pos);
					if char != ord("\"") || string_ord_at(str, pos - 1) == ord("\\")
						pos += 1;
					else
						break;
				}
				
				if pos <= len
				{
					var val = string_copy(str, start + 1, pos - start - 1);
					val = string_replace_all(val, "\\\"", "\"");
					ds_list_add(list, [lexer.value, start, val]);
					pos += 1;
				}
				else
					exit;
				
				break;
			
			default:
				if lang_get_identifier(char, false)
				{
					while pos <= len
					{
						char = string_ord_at(str, pos);
						if lang_get_identifier(char, true)
							pos += 1;
						else
							break;
					}
					
					var name = string_copy(str, start, pos - start);
					switch name
					{
						case "false":
							ds_list_add(list, [lexer.keyword, start, false]);
							break;
						case "noone":
							ds_list_add(list, [lexer.keyword, start, noone]);
							break
						case "true":
							ds_list_add(list, [lexer.keyword, start, true]);
							break;
						default:
							ds_list_add(list, [lexer.name, start, name]);
					}
				}
				break;
		}
	}
	ds_list_add(list, [lexer.eof, len + 1]);
}

function lang_get_identifier(keycode, allow_numbers)
{
	if allow_numbers
		return keycode == ord("_") || (keycode >= ord("a") && keycode <= ord("z")) || (keycode >= ord("A") && keycode <= ord("Z")) || (keycode >= ord("0") && keycode <= ord("9"));
	else
		return keycode == ord("_") || (keycode >= ord("a") && keycode <= ord("z")) || (keycode >= ord("A") && keycode <= ord("Z"));
}

function lang_exec(token_list, map = ds_map_create()) // HAHAHA
{
	var len = ds_list_size(token_list);
	
	var pos = 0;
	while pos < len
	{
		var q = ds_list_find_value(token_list, pos++);
		switch q[0]
		{
			case lexer.set: // 0 is enum
				var ident = array_get(ds_list_find_value(token_list, pos - 2), 2);
				var val = array_get(ds_list_find_value(token_list, pos++), 2);
				ds_map_set(map, ident, val);
				break;
		}
	}
	return map;
}

global.ttf_fonts = ds_list_create();
function draw_font_is_ttf()
{
	return ds_list_find_index(global.ttf_fonts, draw_get_font()) != -1;
}

function lang_get_custom_font(fontname, language)
{
	var _dir = concat(fontname, "_dir");
	if is_undefined(language[? _dir])
		return;
	
	var path = concat("data/lang/", language[? _dir]);
	if !file_exists(path)
		return concat("File ", path, " not found");
	
	switch string_lower(filename_ext(path))
	{
		case ".ttf": case ".otf":
			if language[? "use_ttf"] != true
				return concat("Skipping ", fontname, ", set use_ttf to true to use TTF or OTF fonts");
			
			var font_size = ds_map_find_value(language, concat(fontname, "_size"));
			if is_undefined(font_size) or string_digits(font_size) != font_size
			{
				show_message(concat("Missing ", fontname, "_size entry in language \"", language[? "display_name"], "\", defaulting to \"16\""));
				font_size = 16;
			}
			else
				font_size = real(font_size);
			
			var f = font_add(path, font_size, false, false, 32, 127);
			ds_list_add(global.ttf_fonts, f);
			return f;
		
		case ".png": case ".gif": case ".jpg": case ".jpeg":
			try
			{
				var font_map = language[? concat(fontname, "_map")];
				if is_undefined(font_map)
					return concat(fontname, "_map entry does not exist");
				var font_size = string_length(font_map);
				var font_sep = language[? concat(fontname, "_sep")];
				
				var font_xorig = 0;
				var font_yorig = 0;
				
				var spr = sprite_add(path, font_size, false, false, font_xorig, font_yorig);
				if sprite_exists(spr) // prop doesnt work. sprite_add doesnt detect visual size
					return font_add_sprite_ext(spr, font_map, false, real(font_sep));
				else
					return "Failed to import the font's sprite";
			}
			catch (e)
			{
				return concat("Unhandled exception", $"\n\n{e.longMessage}\n---\n\nstacktrace: {e.stacktrace}");
			}
		
		default:
			return concat("Unknown file extension ", filename_ext(path), "\nSupported extensions are .ttf, .otf, .png, .gif, .jpg and .jpeg");
	}
}

function lang_get_font(fontname)
{
	if live_call(fontname) return live_result;
	
	if fontname == "bigfont" && check_sugary()
		fontname = "bigfont_ss";
	
	var n = ds_map_find_value(global.font_map, lang_get_value(fontname));
	if !is_undefined(n)
		return n;
	return ds_map_find_value(global.font_map, concat(fontname, "_en"));
}

// pto
function lang_value_exists(entry)
{
	return !is_undefined(lang_get_value_raw(global.lang, entry));
}

function lang_switch(lang)
{
	if global.lang == lang && room != Loadiingroom
		exit;
	if instance_exists(obj_langload)
		exit;
	
	global.lang_offload = global.lang;
	if room == Loadiingroom
		global.lang_offload = noone;
	
	if is_undefined(ds_map_find_value(global.lang_map, lang))
		lang = "en";
	global.lang = lang;
	
	with instance_create(0, 0, obj_langload)
	{
		if room == Loadiingroom
			alarm[0] = 30;
	}
}

function lang_has_graphics(lang)
{
	return global.lang_map[? lang][? "custom_graphics"] ?? false;
}
