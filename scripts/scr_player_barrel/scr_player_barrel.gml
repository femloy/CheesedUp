function scr_player_barrel()
{
	image_speed = abs(movespeed) / 4;
	if (image_speed < 0.35)
		image_speed = 0.35;
	if (image_speed > 0.85)
		image_speed = 0.85;
	hsp = movespeed;
	move = key_right + key_left;
	if (move != 0)
	{
		if (move == xscale)
			movespeed = Approach(movespeed, xscale * 8, 0.5);
		else
			movespeed = Approach(movespeed, 0, 0.5);
		if (movespeed <= 0)
			xscale = move;
	}
	else
		movespeed = Approach(movespeed, 0, 0.5);
	if (sprite_index == spr_barrelland && floor(image_index) == (image_number - 1))
		sprite_index = spr_barrelidle;
	if (grounded)
	{
		if (sprite_index != spr_barrelland)
		{
			if (hsp != 0)
				sprite_index = spr_barrelmove;
			else
				sprite_index = spr_barrelidle;
		}
		var slope = check_slope(x, y + 1, true);
		if (slope && hsp != 0)
		{
			with slope
			{
				if (sign(image_xscale) == -sign(other.xscale))
					other.movespeed = Approach(other.movespeed, other.xscale * 12, 0.5);
			}
		}
		if (input_buffer_jump > 0 && !key_down && vsp > 0)
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			vsp = IT_jumpspeed();
			if (move != xscale && move != 0)
			{
				if (sign(movespeed) == 1)
					xscale = move;
			}
			state = states.barreljump;
			sprite_index = spr_barreljump;
			image_index = 0;
			jumpstop = false;
			create_particle(x, y, part.highjumpcloud1, 0);
		}
		if (key_attack)
		{
			movespeed = xscale * 7;
			sound_play_3d("event:/sfx/barrel/start", x, y);
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust);
			state = states.barrelslide;
			sprite_index = spr_barrelslipnslide;
			image_index = 0;
		}
	}
	else if (!grounded)
	{
		state = states.barreljump;
		sprite_index = spr_barrelfall;
		image_index = 0;
		if (vsp < 0)
			sprite_index = spr_barreljump;
	}
	if (check_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y))
	{
		movespeed = 0;
		if (sprite_index == spr_barrelmove)
			sprite_index = spr_barrelidle;
	}
	if (sprite_index == spr_barrelmove)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, part.cloudeffect, 0);
			steppybuffer = 14;
			sound_play_3d(stepsnd, x, y);
		}
	}
}
