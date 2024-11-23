if global.jukebox != noone
	exit;

with (obj_music)
{
	if (music != noone)
		fmod_event_instance_stop(music.event, false);
}
