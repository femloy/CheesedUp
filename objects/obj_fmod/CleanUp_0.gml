if ds_exists(global.sound_map, ds_type_map)
	ds_map_destroy(global.sound_map);
while array_length(banks)
	fmod_bank_unload(array_pop(banks).handle);
