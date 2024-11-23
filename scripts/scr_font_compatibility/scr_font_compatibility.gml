if !YYC
	message = "don't steal my code shithead";

#macro font_add_sprite_ext_base font_add_sprite_ext
#macro font_add_sprite_ext font_add_sprite_ext_hook

function font_add_sprite_ext_hook(spr, mapstring, prop, sep)
{
	if !variable_global_exists("font_offsets")
		global.font_offsets = ds_map_create();
	
	var off = {x: sprite_get_xoffset(spr), y: sprite_get_yoffset(spr)};
	sprite_set_offset(spr, 0, 0);
	
	var f = font_add_sprite_ext_base(spr, mapstring, prop, sep);
	ds_map_set(global.font_offsets, real(f), off);
	
	return f;
}

function font_get_offset(font = draw_get_font())
{
	return global.font_offsets[? real(font)] ?? {x: 0, y: 0};
}

function draw_text_new(x, y, str)
{
	var info = font_get_offset();
	draw_text(x - info.x, y - info.y, str);
}
function draw_text_color_new(x, y, str, c1, c2, c3, c4, alpha)
{
	var info = font_get_offset();
	draw_text_color(x - info.x, y - info.y, str, c1, c2, c3, c4, alpha);
}
function draw_text_ext_new(x, y, str, sep, w)
{
	var info = font_get_offset();
	draw_text_ext(x - info.x, y - info.y, str, sep, w);
}
function draw_text_transformed_new(x, y, str, xscale, yscale, angle)
{
	var info = font_get_offset();
	draw_text_transformed(x - info.x, y - info.y, str, xscale, yscale, angle);
}
function draw_text_transformed_color_new(x, y, str, xscale, yscale, angle, c1, c2, c3, c4, alpha)
{
	var info = font_get_offset();
	draw_text_transformed_color(x - info.x, y - info.y, str, xscale, yscale, angle, c1, c2, c3, c4, alpha);
}
function draw_text_ext_color_new(x, y, str, sep, w, c1, c2, c3, c4, alpha)
{
	var info = font_get_offset();
	draw_text_ext_color(x - info.x, y - info.y, str, sep, w, c1, c2, c3, c4, alpha);
}
function draw_text_ext_transformed_new(x, y, str, sep, w, xscale, yscale, angle)
{
	var info = font_get_offset();
	draw_text_ext_transformed(x - info.x, y - info.y, str, sep, w, xscale, yscale, angle);
}
function draw_text_ext_transformed_color_new(x, y, str, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha)
{
	var info = font_get_offset();
	draw_text_ext_transformed_color(x - info.x, y - info.y, str, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha);
}
