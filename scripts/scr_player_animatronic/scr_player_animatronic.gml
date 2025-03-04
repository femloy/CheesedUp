function scr_player_animatronic()
{
	sprite_index = spr_animatronic;
	image_speed = 0.35;
	
	if character == "N" or character == "D"
	{
		xscale = 1;
		if !grounded
			sprite_index = spr_doise_deadair;
		
		if animatronic_buffer > 0
			animatronic_buffer--;
		else if grounded && character != "D"
			instance_create_unique(x, y, obj_noiseanimatroniceffect);
		
		exit;
	}
	
	move = key_left + key_right;
	hsp = move * movespeed;
	if (vsp < 0 && !key_jump2 && !jumpstop)
	{
		jumpstop = true;
		vsp /= 10;
	}
	if (move != 0)
	{
		xscale = move;
		movespeed = 4;
	}
	else
		movespeed = 0;
	if (animatronic_buffer > 0)
		animatronic_buffer--;
	else
	{
		sound_play_3d("event:/sfx/misc/detransfo", x, y);
		with (instance_create(x, y, obj_peshinodebris))
			image_index = 0;
		with (instance_create(x, y, obj_peshinodebris))
			image_index = 1;
		with (instance_create(x, y, obj_peshinodebris))
			image_index = 2;
		state = states.normal;
	}
	if (animatronic_collect_buffer > 0)
		animatronic_collect_buffer--;
	else
	{
		animatronic_collect_buffer = 30;
		if (global.collect > 0)
		{
			GamepadSetVibration(0, 0.4, 0.4, 0.65);
			global.collect -= 10;
			sound_play_3d("event:/sfx/pep/hurt", x, y);
			with (instance_create(121, 60, obj_negativenumber))
				number = "-10";
			repeat (10)
				create_debris(x, y, choose(spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_pineapplecollect, spr_sausagecollect), true);
		}
		if (global.collect < 0)
			global.collect = 0;
	}
	if (can_jump && vsp > 0 && input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		vsp = IT_jumpspeed();
		jumpstop = false;
	}
	if (move != 0 && grounded && vsp > 0)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, part.cloudeffect, 0);
			steppybuffer = 12;
			sound_play_3d(stepsnd, x, y);
		}
	}
}
