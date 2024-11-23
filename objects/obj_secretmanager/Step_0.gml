for (var i = 0; i < ds_list_size(secrettriggers); i++)
{
	var b = ds_list_find_value(secrettriggers, i);
	if (b[0] != noone)
	{
		if live_enabled
			live_method(id, b[0])();
		else
			method(id, b[0])();
	}
}
