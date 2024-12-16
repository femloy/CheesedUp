if global.jukebox == noone
{
	instance_destroy();
	exit;
}

if global.panic
{
	instance_destroy();
	exit;
}

persistent = true;
count = 0;

flags.do_once_per_save = true;
output = function()
{
	instance_create_unique(0, 0, obj_hungrypillarflash);
	activate_panic(true);
}

condition = function()
{
	if room != sucrose_1 && room != sucrose_2
	{
		instance_destroy();
		return false;
	}
	
    with obj_music
	{
		if music != noone
			return fmod_event_instance_get_timeline_pos(music.event) >= 9.5 * 1000 - 60;
		else
			return ++other.count >= 9.5 * 60;
	}
}
