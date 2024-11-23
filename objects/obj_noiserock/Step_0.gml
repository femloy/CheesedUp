if (!check_solid(x, y + 1) && vsp > 0 && hit == 0)
	falling = true;
if (check_solid(x, y + 1) && falling == 1)
	falling = false;
if (!place_meeting(x, y, obj_noisetrap_rock))
	hsp = 0;
if (falling == 1 && hit == 0)
	hsp = 0;
scr_collide();
