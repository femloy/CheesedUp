live_auto_call;

if !variable_instance_exists(id, "shellSurface")
	exit;

if surface_exists(shellSurface)
	surface_free(shellSurface);
if ds_exists(deferredQueue, ds_type_queue)
	ds_queue_destroy(deferredQueue);

scr_wc_cleanup();
