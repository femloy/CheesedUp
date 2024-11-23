gameframe_caption_text = ""; // empty window title
global.experimental = false; // make console useless

if instance_exists(obj_fmod)
{
	fmod_event_instance_set_paused_all(true);
	sound_play(mu_dungeondepth);
}

// delete anything that might help you escape
with all
{
	if object_index != obj_screensizer && object_index != obj_gmlive && object_index != obj_fmod && object_index != obj_softlockcrash
	&& (object_index != obj_shell or !DEBUG)
		instance_destroy(id, false);
}

// fade in
with instance_create(0, 0, obj_genericfade)
	deccel = 0.01;
