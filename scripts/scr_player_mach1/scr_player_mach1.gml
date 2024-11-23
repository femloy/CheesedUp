function scr_player_mach1()
{
	var maxmovespeed = 8;
	var accel = 0.075;
	var jumpspeed = -11;
	
	if character == "MS"
		jumpspeed = scr_stick_jumpspeed();
	
	image_speed = 0.5;
	landAnim = false;
	machhitAnim = false;
	crouchslideAnim = true;
	dir = xscale;
	move = key_left + key_right;
	
	if (scr_solid(x + xscale, y) && (!check_slope(x + xscale, y) || scr_solid_slope(x + sign(hsp), y)))
	{
		mach2 = 0;
		state = states.normal;
		movespeed = 0;
	}
	
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (xscale * movespeed) + (railmovespeed * raildir);
	
	if (xscale != move && move != 0)
	{
		sprite_index = spr_mach1;
		image_index = 0;
		momemtum = false;
		mach2 = 0;
		movespeed = 6;
		xscale = move;
	}
	if (grounded)
	{
		if (movespeed <= maxmovespeed)
			movespeed += accel;
		if (movespeed >= maxmovespeed)
		{
			state = states.mach2;
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
		}
		if (vsp > 0)
			jumpstop = false;
		if (!instance_exists(dashcloudid))
		{
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = other.xscale;
				other.dashcloudid = id;
			}
		}
		if (sprite_index != spr_mach1 && vsp > 0)
		{
			sprite_index = spr_mach1;
			image_index = 0;
		}
		if (input_buffer_jump > 0)
		{
			input_buffer_jump = 0;
			
			scr_fmod_soundeffect(jumpsnd, x, y);
			sprite_index = spr_airdash1;
			image_index = 0;
			dir = xscale;
			momemtum = true;
			vsp = jumpspeed;
			jumpAnim = true;
		}
	}
	else if (sprite_index != spr_airdash1)
		sprite_index = spr_airdash2;
	
	if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
		sprite_index = spr_airdash2;
	
	if (!key_attack)
	{
		state = states.normal;
		image_index = 0;
	}
	if (!key_jump2 && !jumpstop && vsp < 0.5)
	{
		vsp /= 10;
		jumpstop = true;
	}
	if (check_solid(x + xscale, y) && !check_slope(x + sign(hsp), y))
	{
		movespeed = 0;
		state = states.normal;
	}
	switch (character)
	{
		case "V":
			scr_vigi_shoot();
			scr_vigi_throw();
			break;
	}
	
	if (scr_check_groundpound() && !grounded)
	{
		input_buffer_slap = 0;
		image_index = 0;
		pistolanim = noone;
		state = IT_FINAL ? states.freefall : states.freefallprep;
		
		if (!shotgunAnim)
		{
			sprite_index = spr_bodyslamstart;
			if IT_FINAL
				vsp = -6;
			else
				vsp = CHAR_OLDNOISE ? -7 : -5;
		}
		else if (character != "N")
		{
			sound_play_3d("event:/sfx/enemies/killingblow", x, y);
			sprite_index = spr_shotgunjump1;
			vsp = -11;
			
			with (instance_create(x, y, obj_shotgunblast))
			{
				sprite_index = spr_shotgunblastdown;
				with (bulletID)
				{
					sprite_index = other.sprite_index;
					mask_index = other.mask_index;
				}
			}
		}
		else
		{
			notification_push(notifs.shotgunblast_start, [room]);
			state = states.shotgunshoot;
			minigunshot = 3;
			minigunbuffer = 0;
			sprite_index = spr_playerN_minigundown;
			image_index = 0;
		}
	}
	scr_dotaunt();
}
