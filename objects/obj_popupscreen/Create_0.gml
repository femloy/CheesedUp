live_auto_call;

depth = -10000;
if instance_number(object_index) > 1
{
	pause = false;
	with obj_popupscreen
		other.depth = min(other.depth, depth - 1);
}

if pause
{
	do_sounds = !(instance_exists(obj_pause) && obj_pause.pause);
	instance_list = ds_list_create();
	scr_create_pause_image(true);
	scr_pause_deactivate_objects(do_sounds);
}
type = 0;

on_open = noone;
on_close = noone;
callback_buffer = 1;

scr_init_input();
sound_play("event:/modded/sfx/diagopen");

state = 0;
t = 0;
bg_alpha = 0;

surfaces = [];
ensure_surface = function(index, width, height)
{
	if index >= array_length(surfaces) or !surface_exists(surfaces[index])
		surfaces[0] = surface_create(width, height);
}

anim_outback = animcurve_get_channel(curve_menu, "outback");
anim_incubic = animcurve_get_channel(curve_menu, "incubic");
