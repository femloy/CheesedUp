function lang_sprites_preload(lang)
{
	if is_undefined(global.lang_sprite_map[? lang])
		global.lang_sprite_map[? lang] = ds_map_create();
	
	var root = $"data/lang/sprites/{lang}/";
	for (var file = file_find_first($"{root}*.*", 0); file != ""; file = file_find_next())
	{
		var sprite_name = filename_change_ext(file, "");
		if sprite_name != "spr_lang_flag" && sprite_name != "spr_lang_name"
			continue;
		lang_sprite_parse(lang, root, file);
	}
	file_find_close();
}
function lang_sprite_parse(lang, root, file)
{
	var filepath = concat(root, file);
	var sprite_name = filename_change_ext(file, "");
		
	trace("File found ", filepath, " sprite would be \"", sprite_name, "\"", " filename_ext ", filename_ext(file));
		
	if asset_get_type(sprite_name) != asset_sprite
		return false;
	
	ini_open(concat(root, "data.ini"));
	if filename_ext(file) == ".png"
	{
		var images = ini_read_string(sprite_name, "images", "");
		var xoffset = ini_read_string(sprite_name, "xoffset", "");
		var yoffset = ini_read_string(sprite_name, "yoffset", "");
		if string_digits(images) != ""
			images = ini_read_real(sprite_name, "images", 0);
		else
			images = undefined;
		if string_digits(xoffset) != ""
			xoffset = ini_read_real(sprite_name, "xoffset", 0);
		else
			xoffset = undefined;
		if string_digits(yoffset) != ""
			yoffset = ini_read_real(sprite_name, "yoffset", 0);
		else
			yoffset = undefined;
		ini_close();
			
		var original_index = asset_get_index(sprite_name);
		var width = image_get_width(filepath);
		if width == noone
			return false;
				
		var spr = sprite_add(filepath, images ?? floor(width / sprite_get_width(original_index)), false, 0, xoffset ?? sprite_get_xoffset(original_index), yoffset ?? sprite_get_yoffset(original_index));
		sprite_set_speed(spr, sprite_get_speed(original_index), sprite_get_speed_type(original_index));
		global.lang_sprite_map[? lang][? original_index] = spr;
		return true;
	}
	else if filename_ext(file) == ".gif"
	{
		var xoffset = ini_read_string(sprite_name, "xoffset", "");
		var yoffset = ini_read_string(sprite_name, "yoffset", "");
		if string_digits(xoffset) != ""
			xoffset = ini_read_real(sprite_name, "xoffset", 0);
		else
			xoffset = undefined;
		if string_digits(yoffset) != ""
			yoffset = ini_read_real(sprite_name, "yoffset", 0);
		else
			yoffset = undefined;
		ini_close();
			
		var original_index = asset_get_index(sprite_name);
		var spr = sprite_add_gif(filepath, xoffset ?? sprite_get_xoffset(original_index), yoffset ?? sprite_get_yoffset(original_index));
		sprite_set_speed(spr, sprite_get_speed(original_index), sprite_get_speed_type(original_index));
		global.lang_sprite_map[? lang][? original_index] = spr;
		return true;
	}
	ini_close();
	return false;
}
function lang_get_sprite(sprite)
{
	if lang_get_value("custom_graphics")
	{
		var g = ds_map_find_value(global.lang_sprite_map[? global.lang], sprite);
		if !is_undefined(g) && sprite_exists(g)
			return g;
	}
	return undefined;
}
function lang_draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, col, alpha)
{
	var spr = lang_get_sprite(sprite) ?? sprite;
	draw_sprite_ext(spr, subimg, x, y, xscale, yscale, rot, col, alpha);
}
function lang_draw_sprite(sprite, subimg, x, y)
{
	var color = draw_get_color();
	var alpha = draw_get_alpha();
	lang_draw_sprite_ext(sprite, subimg, x, y, 1, 1, 0, color, alpha);
}
