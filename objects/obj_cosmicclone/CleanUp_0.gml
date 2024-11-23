live_auto_call;

ds_queue_destroy(queue);
if surface_exists(surf)
	surface_free(surf);

destroy_sounds([
	snd_voicehurt,
	snd_jump,
]);
