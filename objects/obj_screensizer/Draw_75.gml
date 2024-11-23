live_auto_call;

global.Pattern_Texture_Indexed = -4;

surface_reset_target();
shader_reset();
draw_set_alpha(1);
draw_set_colour(c_white);

if !surface_exists(gui_surf)
{
	gpu_set_blendmode(bm_normal);
	exit;
}

var shd = false;
if (frac(app_scale) > 0 && global.option_texfilter)
{
	var tex = surface_get_texture(gui_surf);
	var tw = texture_get_texel_width(tex);
	var th = texture_get_texel_height(tex);
	shader_set(shd_aa);
	gpu_set_texfilter(true);
	shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th);
	shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), window_get_width() / surface_get_width(gui_surf), window_get_height() / surface_get_height(gui_surf));
	shd = true;
}

// draw it
reset_blendmode();
if global.option_scale_mode != 2
{
	var _w = display_get_gui_width() * app_scale;
	var _h = display_get_gui_height() * app_scale;
	draw_surface_ext(gui_surf, floor(window_to_gui_x((window_get_width() / 2) - (_w / 2))), floor(window_to_gui_y((window_get_height() / 2) - (_h / 2))), window_to_gui_xscale(app_scale), window_to_gui_yscale(app_scale), 0, c_white, 1);
}
else
	draw_surface(gui_surf, 0, 0);

gpu_set_blendmode(bm_normal);
gpu_set_texfilter(false);

shader_reset();
if (lang_init)
	gameframe_caption_font = lang_get_font("captionfont");
if window_has_focus() && global.gameframe_enabled
	gameframe_draw();

//draw_sprite(spr_player_idle, 0, mx - camera_get_view_x(view_camera[0]), my - camera_get_view_y(view_camera[0]));
