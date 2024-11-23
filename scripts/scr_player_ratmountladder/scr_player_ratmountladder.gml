function scr_player_ratmountladder()
{
	/*
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	*/
	
	movespeed = 0;
	hsp = 0;
	if (key_up && !hooked)
	{
		sprite_index = spr_lonegustavoladder;
		vsp = -6;
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, part.cloudeffect, 0);
			steppybuffer = 12;
			sound_play_3d(stepsnd, x, y);
		}
		image_speed = 0.35;
	}
	else if (key_down && !hooked)
	{
		sprite_index = spr_lonegustavoladderdown;
		vsp = 10;
		image_speed = -0.35;
	}
	else
	{
		sprite_index = spr_lonegustavoladder;
		vsp = 0;
		image_speed = 0;
	}
	ladderbuffer = 20;
	if (!place_meeting(x, y, obj_ladder) && !place_meeting(x, y, obj_stairs))
	{
		hooked = false;
		state = states.ratmountjump;
		sprite_index = spr_ratmount_groundpoundfall;
		image_index = 0;
		vsp = 0;
	}
	if (input_buffer_jump > 0)
	{
		hooked = false;
		input_buffer_jump = 0;
		ladderbuffer = 20;
		if (place_meeting(x, y, obj_hookup))
			ladderbuffer = 30;
		state = states.ratmountjump;
		sprite_index = spr_ratmount_groundpound;
		if (key_down)
			vsp = 5;
		else
			vsp = -9;
		image_index = 0;
		jumpAnim = true;
		image_speed = 0.35;
	}
	if (key_down && grounded && !place_meeting(x, y, obj_platform))
	{
		image_speed = 0.35;
		hooked = false;
		sprite_index = spr_ratmount_groundpoundfall;
		state = states.ratmountjump;
		image_index = 0;
	}
}
