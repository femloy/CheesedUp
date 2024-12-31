function scr_player_grind()
{
	sprite_index = !skateboarding ? spr_grind : spr_clown;
	image_speed = 0.35;
	machhitAnim = false;
	crouchslideAnim = true;
	hsp = xscale * movespeed;
	if (movespeed < 10)
		movespeed = Approach(movespeed, 10, 0.5);
	if (!place_meeting(x, y + 18, obj_grindrail) && !place_meeting(x, y + 18, obj_grindrailslope))
	{
		if (movespeed < 12 || skateboarding)
		{
			state = states.mach2;
			sprite_index = spr_mach2jump;
		}
		else
		{
			state = states.mach3;
			sprite_index = spr_mach4;
		}
	}
	if (check_solid(x + xscale, y) && !place_meeting(x, y + 18, obj_grindrailslope) && !check_slope(x, y + 1))
	{
		if REMIX
		{
			instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
			sound_play_3d(sfx_bumpwall, x, y);
		}
		
		if (character != "N")
		{
			state = states.bump;
			hsp = -xscale * 5;
			vsp = 1;
		}
		else
			xscale *= -1;
	}
	
	if character == "N" && key_down
	{
		ignore_grind = true;
		state = states.mach2;
		sprite_index = spr_playerN_grindcancel;
		image_index = 0;
		vsp = 10;
		if movespeed < 6
			movespeed = 6;
		exit;
	}
	
	if (input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust);
		vsp = IT_jumpspeed();
		jumpstop = false;
		if (skateboarding)
		{
			sprite_index = spr_clownjump;
			image_index = 0;
		}
		if (movespeed < 12 || skateboarding)
		{
			state = states.mach2;
			sprite_index = spr_mach2jump;
		}
		else
		{
			state = states.mach3;
			sprite_index = spr_mach3jump;
		}
		
		/*
		if BO_NOISE && character == "BN"
		{
			sprite_index = spr_playerBN_grindJump;
			image_index = 0;
		}
		*/
	}
	if (!instance_exists(obj_grindeffect))
		instance_create(x, y, obj_grindeffect);
}
