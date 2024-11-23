if (check_solid(x + hsp, y))
	hsp *= -1;
scr_collide();
if (place_meeting(x, y, obj_destructibles))
	depth = 102;
else
	depth = 2;
