depth = -9999;

lang = global.lang;
old_name = "";
new_name = lang_get_value_raw(lang, "display_name") ?? "UNKNOWN";
root = $"data/lang/sprites/{lang}/";

sprites_to_load = [];
sprites_to_unload = [];

if global.lang_offload != noone
{
	var offload_map = global.lang_sprite_map[? global.lang_offload];
	old_name = lang_get_value_raw(global.lang_offload, "display_name") ?? "UNKNOWN";
	
	if offload_map != undefined
	{
		var spr = ds_map_find_first(offload_map);
		while !is_undefined(spr)
		{
			if spr != spr_lang_flag && spr != spr_lang_name
				array_push(sprites_to_unload, offload_map[? spr]);
			spr = ds_map_find_next(offload_map, spr);
		}
	}
}

if lang_has_graphics(lang)
{
	for (var file = file_find_first($"{root}*.*", 0); file != ""; file = file_find_next())
	{
		var sprite_name = filename_change_ext(file, "");
		if sprite_name == "spr_lang_flag" or sprite_name == "spr_lang_name"
			continue;
		array_push(sprites_to_load, file);
	}
}

tex_max = array_length(sprites_to_unload) + array_length(sprites_to_load);
tex_cur = 0;
text = "";

alarm[0] = 5;
