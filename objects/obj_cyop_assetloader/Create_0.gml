to_load = ds_list_create();
wait = method(self, function()
{
	if ds_list_size(to_load) == 0
	{
		trace("Done with sprites!");
		if is_callable(done_func)
			done_func();
		instance_destroy();
		return false;
	}
	else if sprite_exists(titlecard) && ds_list_find_index(to_load, titlecard) < 0
	{
		trace("Titlecard loaded in!");
		if is_callable(done_func)
			done_func();
		return false;
	}
	
	trace($"Waiting for sprites: {ds_list_size(to_load)}");
	return true;
});
done_func = noone;
titlecard = noone;
