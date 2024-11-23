if is_string(objectlist)
	objectlist = [asset_get_index(objectlist)];
else if !is_array(objectlist)
{
	if object_exists(objectlist)
		objectlist = [objectlist];
	else
	{
		with instance_create(0, 0, obj_langerror)
			text = "ERROR: Found an invalid conveyor spawner!";
		instance_destroy();
		exit;
	}
}

if (delay > 0)
	delay--;
else
{
	delay = delaymax;
	pos++;
	if (pos >= array_length(objectlist))
		pos = 0;
	with (instance_create(x, y - 32, objectlist[pos]))
	{
		repeat (4)
			instance_create(x, y, obj_factorycreateeffect);
		switch (object_index)
		{
			case obj_dashpad:
				image_xscale = other.dir;
				break;
			case obj_superspring:
				use_collision = true;
				break;
			case obj_pinballlauncher:
				use_collision = true;
				break;
		}
	}
}
