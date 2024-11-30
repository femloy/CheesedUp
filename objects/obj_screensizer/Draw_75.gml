live_auto_call;

global.Pattern_Texture_Indexed = -4;

surface_reset_target();
draw_set_alpha(1);
draw_set_colour(c_white);

if !surface_exists(gui_surf)
{
	gpu_set_blendmode(bm_normal);
	exit;
}

#region CHAT

with obj_netchat
{
	if !surface_exists(other.chat_surf)
		other.chat_surf = surface_create(GUI_WIDTH, GUI_HEIGHT);
	else if surface_get_width(other.chat_surf) != GUI_WIDTH || surface_get_height(other.chat_surf) != GUI_HEIGHT
		surface_resize(other.chat_surf, GUI_WIDTH, GUI_HEIGHT);
	
	surface_set_target(other.chat_surf);
	draw_clear_alpha(c_black, 0);
	
	style.draw();
	
	surface_reset_target();
}

#endregion

var shd = false;
if /*frac(app_scale) > 0 && */global.option_texfilter
{
	//var tex = surface_get_texture(gui_surf);
	//var tw = texture_get_texel_width(tex);
	//var th = texture_get_texel_height(tex);
	//shader_set(shd_aa);
	gpu_set_texfilter(true);
	//shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th);
	//shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), window_get_width() / surface_get_width(gui_surf), window_get_height() / surface_get_height(gui_surf));
	//shd = true;
}

// draw it
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
var _x = 0, _y = 0, _xscale = 1, _yscale = 1;
if global.option_scale_mode != 2
{
	var _w = display_get_gui_width() * app_scale;
	var _h = display_get_gui_height() * app_scale;
	var _x = window_to_gui_x((window_get_width() / 2) - (_w / 2));
	var _y = window_to_gui_y((window_get_height() / 2) - (_h / 2));
	var _xscale = window_to_gui_xscale(app_scale);
	var _yscale = window_to_gui_yscale(app_scale);
}
draw_surface_ext(gui_surf, _x, _y, _xscale, _yscale, 0, c_white, 1);

// CHAT
with obj_netchat
{
	style.pre_draw(_x, _y, _xscale, _yscale);
	draw_surface_ext(other.chat_surf, _x, _y, _xscale, _yscale, 0, c_white, 1);
}

toggle_alphafix(false);
gpu_set_texfilter(false);

if lang_init
	gameframe_caption_font = lang_get_font("captionfont");
if window_has_focus() && global.gameframe_enabled
	gameframe_draw();
