function scr_player_knightpepattack()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hsp = xscale * movespeed;
	if (movespeed > 0)
	{
		if (grounded)
			movespeed -= 0.3;
		else
			movespeed -= 0.2;
	}
	if (floor(image_index) == (image_number - 1))
		image_index = image_number - 1;
	if (movespeed <= 0)
	{
		movespeed = 0;
		sprite_index = spr_knightpep_idle;
		state = states.knightpep;
	}
	var slope = check_slope(x, y + 1, true);
	if (slope && sprite_index != spr_knightpepthunder)
	{
		movespeed = 2;
		knightmomentum = 0;
		with slope
			other.xscale = -sign(image_xscale);
		state = states.knightpepslopes;
		sprite_index = spr_knightpepdownslope;
		slope_buffer = 20;
	}
	if (check_solid(x + hsp, y) && scr_preventbump() && !check_slope(x + hsp, y))
		movespeed = 0;
	if (grounded)
		doublejump = false;
	if (key_jump && grounded && vsp > 0)
	{
		if (movespeed <= 8)
			movespeed = 8;
		vsp = IT_jumpspeed();
		state = states.knightpepslopes;
		sprite_index = spr_knightpepdoublejump;
		image_index = 0;
	}
	if (!grounded && !doublejump)
	{
		state = states.knightpep;
		sprite_index = spr_knightpepjump;
		image_index = 0;
	}
	image_speed = 0.35;
}
