if (cooldown > 0)
	cooldown--;
if (check_solid(x + hsp, y))
	hsp *= -1;
if (hit)
	angle += spinspeed;
if (grounded && vsp > 0 && hit)
	instance_destroy();
scr_collide();
