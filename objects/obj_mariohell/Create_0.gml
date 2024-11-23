live_auto_call;

gameframe_caption_text = "M";
character = "";

x = 0;
y = 0;

instance_list = ds_list_create();
sound_list = ds_list_create();
sound_pause_all(true);
scr_pause_deactivate_objects(false);
instance_deactivate_object(obj_globaltimer);

depth = -9999;
alarm[0] = room_speed * 3;
con = 0;

music = fmod_event_create_instance("event:/modded/mario");
txtsnd = fmod_event_create_instance("event:/modded/mariotalk");

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");

camera_set_view_pos(view_camera[0], 0, 0);

dialog = 
{
	array: [],
	c: 0,
	active: false,
	index: 0,
	timer: -1,
	anim_t: 0,
}
create_dialog = function(text_array)
{
	dialog = 
	{
		array: text_array,
		c: 0,
		active: array_length(text_array) > 0,
		index: 0,
		timer: -1,
		anim_t: 0,
	}
	return dialog;
}
