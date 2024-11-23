live_auto_call;
global.Pattern_Texture_Indexed = noone;

#macro GUI_WIDTH display_get_gui_width()
#macro GUI_HEIGHT display_get_gui_height()

if !surface_exists(gui_surf)
	gui_surf = surface_create(GUI_WIDTH, GUI_HEIGHT);
else if surface_get_width(gui_surf) != GUI_WIDTH || surface_get_height(gui_surf) != GUI_HEIGHT
{
	with obj_pause
		window_buffer = 1;
	surface_resize(gui_surf, GUI_WIDTH, GUI_HEIGHT);
}

surface_set_target(gui_surf);
draw_clear_alpha(c_black, 0);

toggle_alphafix(true);
