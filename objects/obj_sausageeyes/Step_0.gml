hsp = image_xscale * 4;
if (grounded)
	vsp = -11;
if (check_solid(x + sign(hsp), y))
	instance_destroy();
scr_collide();
