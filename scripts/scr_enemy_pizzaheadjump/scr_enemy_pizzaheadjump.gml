function scr_enemy_pizzaheadjump()
{
	stompable = false;
	if (check_solid(x, y))
		vsp = -12;
	if (vsp < 0)
	{
		use_collision = false;
		x += hsp;
		y += vsp;
		if (vsp < 20)
			vsp += grav;
	}
	else
		use_collision = true;
	sprite_index = stunfallspr;
	if (grounded && vsp > 0)
	{
		stompable = true;
		state = states.stun;
		stunned = 2;
	}
}
