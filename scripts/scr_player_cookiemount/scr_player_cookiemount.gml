function scr_player_cookiemount()
{
	hsp = movespeed;
	move = key_left + key_right;
	if (move != 0)
	{
		if (move == xscale)
			movespeed = Approach(movespeed, xscale * 16, 0.65);
		else
			movespeed = Approach(movespeed, 0, 0.45);
		if (check_solid(x + hsp, y) && !check_slope(x + hsp, y) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting(x + hsp, y, obj_destructibles))
		{
			if (abs(hsp) < 3)
				hsp = 0;
			else
			{
				scr_fmod_soundeffect(weeniebumpsnd, x, y);
				movespeed = -movespeed * 0.5;
				repeat (3)
				{
					with (create_debris(x, y, spr_slapstar))
					{
						hsp = random_range(-5, 5);
						vsp = random_range(-10, 10);
					}
				}
			}
		}
		if (abs(movespeed) < 3 && move != 0)
			image_speed = 0.35;
		else if (abs(movespeed) > 3 && abs(movespeed) < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else
	{
		if (input_buffer == 0)
			movespeed = approach(movespeed, 0, 0.75);
	}
	if (key_jump)
	{
		movespeed = abs(hsp);
		if (movespeed < 6)
			movespeed = 6;
		dir = xscale;
		state = states.mach2;
		sprite_index = spr_mach2jump;
		jumpstop = 0;
		vsp = -11;
		//ridingmarsh = false;
		instance_create(x, y, obj_jumpdust);
		with (instance_create(x, y, obj_cookiemount))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cookiemountkick;
		}
	}
	if (move == 0 && input_buffer == 0 && sprite_index != spr_cookiemountskid)
	{
		image_speed = 0.35;
		sprite_index = spr_cookiemountidle;
	}
	if (move != 0 && sprite_index != spr_cookiemountskid)
		sprite_index = spr_player_cookiemount;
	if (move != 0 && xscale != move)
	{
		xscale = move;
		image_speed = 0.35;
		image_index = 0;
		sprite_index = spr_player_cookiemount_skid;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_cookiemountskid)
		sprite_index = spr_cookiemount;
}
