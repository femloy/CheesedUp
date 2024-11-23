instance_destroy();
exit;

if global.panic
{
	instance_destroy();
	exit;
}
		
flags.do_once_per_save = true;
output = function()
{
	instance_create_unique(0, 0, obj_hungrypillarflash);
	activate_panic(true);
}

condition = function()
{
    with obj_music
	{
		if music != noone
			return fmod_event_instance_get_timeline_pos(music.event) >= 9.5 * 1000 - 60;
	}
}
