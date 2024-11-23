function scr_player_bee()
{
	image_speed = 0.8;
	sprite_index = spr_hurtwalk;
	movespeed = 10;
	hsp = xscale * movespeed;
	if (check_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y))
		xscale *= -1;
	if (bee_buffer > 0)
		bee_buffer--;
	else
		state = states.normal;
}
