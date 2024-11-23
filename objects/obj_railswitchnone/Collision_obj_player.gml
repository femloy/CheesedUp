if (!active)
{
	global.railspeed = 0;
	with (obj_railparent)
		alarm[0] = 1;
	active = true;
	add_saveroom();
}
