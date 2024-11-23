depth = 0;
while (check_solid(x, y) || place_meeting(x, y, obj_platform))
	y--;
