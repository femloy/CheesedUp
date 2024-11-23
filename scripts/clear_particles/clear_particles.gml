function clear_particles()
{
	ds_list_clear(global.debris_list);
	ds_list_clear(global.collect_list);
	ds_list_clear(global.afterimage_list);
}
