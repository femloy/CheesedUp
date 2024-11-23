function state_player_cottonroll()
{
	SS_CODE_START;
	
	static cotton_afterimagetimer = 6;
	if (movespeed >= 8)
		sprite_index = spr_cotton_rollMax;
	else
		sprite_index = spr_cotton_roll;
	hsp = xscale * movespeed;
	dir = xscale;
	momemtum = true;
	if (scr_solid(x + xscale, y) && !check_slope(x + xscale, y) && ((!place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_ratblock)) or movespeed < 8))
	{
		xscale *= -1;
		movespeed /= 2;
		instance_create(x, y, obj_bangeffect);
	}
	if (movespeed < 3)
		movespeed = 3;
	if ((grounded && !key_down && movespeed <= 8) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		state = states.cotton;
		sprite_index = spr_cottonidle;
		momemtum = true;
	}
	if (key_jump && !grounded)
	{
		momemtum = true;
		state = states.cotton;
		vsp = -10;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			copy_player_scale(other);
			sprite_index = spr_cottonpoof;
		}
		sound_play_3d("event:/modded/sfx/cottondoublejump", x, y);
	}
	if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		momemtum = true;
		state = states.cotton;
		vsp = -14;
		grav = 0.025;
		image_index = 0;
		sprite_index = spr_cotton_jump;
		instance_create(x, y, obj_highjumpcloud2);
		sound_play_3d("event:/modded/sfx/cottonjump", x, y);
	}
	
	var _xscale = xscale;
	with check_slope(x, y + 1, true)
	{
		var slope_acceleration = abs(image_yscale) / abs(image_xscale);
		if (_xscale == sign(image_xscale))
		{
			if (other.movespeed > 3)
				other.movespeed -= (0.25 * slope_acceleration);
			else
			{
				other.movespeed = 3;
				other.xscale = -sign(image_xscale);
			}
		}
		else if (_xscale == -sign(image_xscale))
		{
			if (other.movespeed < 12)
				other.movespeed += (0.25 * slope_acceleration);
		}
	}
	if movespeed >= 8
	{
		if (cotton_afterimagetimer > 0)
			cotton_afterimagetimer--;
		if (cotton_afterimagetimer <= 0)
		{
			with create_blur_afterimage(x, y, sprite_index, image_index, xscale)
				playerid = other.id;
			cotton_afterimagetimer = 6;
		}
	}
	dir = xscale;
	image_speed = 0.35 + ((movespeed / 12) * 0.35);
	
	SS_CODE_END;
}
