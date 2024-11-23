function scr_fmod_soundeffect(sound_instance, x, y)
{
	sound_instance_move(sound_instance, x, y);
	fmod_event_instance_play(sound_instance);
}
