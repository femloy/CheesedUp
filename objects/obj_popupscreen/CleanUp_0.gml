live_auto_call;

if pause
{
	scr_pause_activate_objects(do_sounds);
	scr_delete_pause_image();
	ds_list_destroy(instance_list);
}
while array_length(surfaces)
{
	var s = array_pop(surfaces);
	if surface_exists(s)
		surface_free(s);
}
