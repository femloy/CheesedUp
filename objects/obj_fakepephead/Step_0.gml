if (thrown)
{
	sprite_index = spr_headprojectile;
	hsp = hithsp;
	vsp = hitvsp;
	if (check_solid(x + sign(hsp), y))
	{
		thrown = false;
		image_xscale *= -1;
		hsp = image_xscale * 4;
		vsp = -4;
	}
}
else
{
	if (grounded)
	{
		hsp = Approach(hsp, 0, 0.5);
		sprite_index = spr_headprojectile_idle;
	}
	if (((grounded && vsp > 0) || check_solid(x, y + 1)) && destroy)
		instance_destroy();
}
scr_collide();
