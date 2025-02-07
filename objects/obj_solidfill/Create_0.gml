for(var xx = 0; xx < room_width; xx += 64)
{
	for(var yy = 0; yy < room_height; yy += 64)
	{
		if collision_point(xx, yy, [self, obj_secretbigblock, obj_secretmetalblock], false, false)
			continue;
		
		with instance_create(xx, yy, obj_solid)
		{
			image_xscale = 2;
			image_yscale = 2;
		}
	}
}
instance_destroy();
