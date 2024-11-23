live_auto_call;

if !is_visible
	exit;
if global.performance
{	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_purple, 1.0);
	exit;
}

var xo = abs(sprite_xoffset);
var yo = abs(sprite_yoffset);
var sprw = abs(sprite_width);
var sprh = abs(sprite_height);

if !surface_exists(surf) or surf_size[0] != sprw or surf_size[1] != sprh
{
	if surface_exists(surf)
		surface_free(surf);
	surf_size = [sprw, sprh];
	surf = surface_create(surf_size[0], surf_size[1]);
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

shader_set(shd_mach3effect);
shader_set_uniform_f(color1, 1, 1, 1);
shader_set_uniform_f(color2, 0, 0, 0);
draw_sprite_ext(sprite_index, image_index, xo, yo, image_xscale, image_yscale, image_angle, c_white, 1.0);

surface_reset_target();
shader_reset();

var x_pos = x - xo;
var y_pos = y - yo;

draw_set_mask_texture(x_pos, y_pos, surface_get_texture(surf));

for(var i = 0; i < array_length(layers); i++)
{
	var x_offset = CAMX * (i * .05);
	var y_offset = CAMY * (i * .05);
	draw_sprite_stretched(layers[i], i == 3 ? layer_4_index : 0, floor(x_pos + (-layer_offsets[i] + x_offset) % 64), y_pos + (y_offset % 64), surf_size[0], surf_size[1]);
}

draw_reset_clip();
