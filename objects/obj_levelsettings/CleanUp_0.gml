live_auto_call;

surface_free(global.modsurf);
surface_free(surface);
surface_free(clip_surface);

if layer_exists(sequence_layer)
	layer_destroy(sequence_layer);

ds_list_destroy(active_modifiers);

close_menu();

with obj_player
	fmod_event_instance_stop(snd_bossdeathN, true);
surface_free(cosmic_surf);

fmod_event_instance_stop(song, false);
fmod_event_instance_release(song);
