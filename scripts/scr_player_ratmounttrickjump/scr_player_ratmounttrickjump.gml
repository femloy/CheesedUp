function scr_player_ratmounttrickjump()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	hsp = movespeed * xscale;
	if (sprite_index != spr_supertaunt1)
		image_speed = 0.35;
	else
	{
		image_speed = 0.5;
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_ratmount_walljump;
	}
	if (ramp_buffer > 0)
		ramp_buffer--;
	if (grounded && ramp_buffer <= 0)
	{
		if (sprite_index == spr_mach2jump)
		{
			if (movespeed > 2)
				state = states.ratmounttumble;
			else
				state = states.ratmount;
		}
		else
		{
			ramp_points = 0;
			sound_play_3d("event:/sfx/pep/groundpound", x, y);
			state = states.ratmount;
			sprite_index = spr_ratmount_land;
			image_index = 0;
			landAnim = true;
		}
		global.collect += (ramp_points * 100);
		ramp = false;
	}
}
