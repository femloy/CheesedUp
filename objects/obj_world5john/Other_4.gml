if !global.panic
	instance_destroy();
else
{
	layer_background_visible(bgid, false);
	if in_saveroom()
		instance_destroy(id, false);
	else
		add_saveroom();
}
