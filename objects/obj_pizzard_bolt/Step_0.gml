x += (image_xscale * 4);
depth = -1;
if (check_solid(x, y) || check_slope(x, y))
	instance_destroy();
