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

count = 0;

flags.do_once_per_save = true;
output = function()
{
    var _bg = layer_background_get_id("Backgrounds_still1");
    layer_background_sprite(_bg, bg_sucrose_skyWakingUp);
    layer_background_index(_bg, 0);
}

condition = function()
{
	with obj_music
	{
		if music != noone
			return fmod_event_instance_get_timeline_pos(music.event) >= 8.17 * 1000 - 60;
		else
			return ++other.count >= 8.17 * 60;
	}
}
