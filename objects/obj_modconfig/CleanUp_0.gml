live_auto_call;

surface_free(global.modsurf);
if layer_exists(sequence_layer)
	layer_destroy(sequence_layer);

while array_length(sections_array)
{
	var sect = array_pop(sections_array);
	sect.dispose();
}
while array_length(submenus_array)
{
	var sect = array_pop(submenus_array);
	sect.dispose();
}

ds_list_destroy(preset_options);
ds_map_destroy(submenus);
