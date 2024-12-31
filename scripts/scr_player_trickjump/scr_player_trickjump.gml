function scr_player_trickjump()
{
	hsp = movespeed * xscale;
	if character != "N"
	{
		if sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4
		{
			image_speed = 0.35;
			if sprite_index == spr_rampjump && floor(image_index) == image_number - 1
				image_index = image_number - 1;
		}
		else
		{
			image_speed = 0.5;
			if floor(image_index) == image_number - 1
				sprite_index = spr_rampjump;
		}
	}
	if scr_solid(x + xscale, y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y)) && scr_preventbump()
	{
		if SUGARY_SPIRE && check_sugary() && key_attack
		{
			if !place_meeting(x + hsp, y, obj_unclimbablewall)
				wallspeed = abs(movespeed);
			else
				wallspeed = -vsp;
			grabclimbbuffer = 10;
			state = states.climbwall;
			vsp = -wallspeed;
		}
		else
		{
			state = states.bump;
			image_index = 0;
			sound_play_3d("event:/sfx/pep/splat", x, y);
			sprite_index = spr_wallsplat;
		}
	}
	if (ramp_buffer > 0)
		ramp_buffer--;
	if (character == "N")
		image_speed = Approach(image_speed, 0.4, 0.1);
	if (grounded && ramp_buffer <= 0)
	{
		image_speed = 0.5;
		if (sprite_index == spr_rampjump)
		{
			sprite_index = spr_rollgetup;
			if (movespeed < 12)
				state = states.mach2;
			else
				state = states.mach3;
		}
		else
		{
			ramp_points = 0;
			sound_play_3d("event:/sfx/pep/groundpound", x, y);
			state = states.freefallland;
			sprite_index = spr_bodyslamland;
			image_index = 0;
		}
		global.collect += (ramp_points * 100);
		ramp = false;
	}
}
