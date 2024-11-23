SS_CODE_START;

if in_saveroom()
{
	has_changed = true;
	sprite_index = ds_list_find_value(global.saveroom, ds_list_find_index(global.saveroom, id) + 1);
}

SS_CODE_END;
