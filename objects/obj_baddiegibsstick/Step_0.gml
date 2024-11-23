if (!collisioned)
{
	if (check_solid(x + hsp, y) && !check_solid(x, y))
		hsp *= -1;
	if (grounded)
	{
		image_speed = 0.35;
		collisioned = true;
		hsp = 0;
		vsp = 0;
		ds_list_add(global.baddietomb, [room, x, y]);
	}
}
scr_collide();
