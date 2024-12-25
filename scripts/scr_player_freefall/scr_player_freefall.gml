function scr_player_freefall()
{
	if !IT_FINAL
	{
		vsp = freefallvsp;
		freefallvsp += 0.2;
	}
	if vsp >= 2 && IT_FINAL
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), part.cloudeffect, 0);
			steppybuffer = 8;
		}
		if (vsp > 17)
		{
			if (punch_afterimage > 0 && (global.afterimage == AFTERIMAGES.mach or REMIX))
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				with (create_blue_afterimage(x, y, sprite_index, image_index, xscale))
				{
					playerid = other.id;
					maxmovespeed = 6;
					vertical = true;
					fadeoutstate = states.freefall;
				}
			}
			if (piledrivereffect > 0)
				piledrivereffect--;
			else
			{
				with (instance_create(x, y, obj_parryeffect))
					sprite_index = spr_piledrivereffect;
				piledrivereffect = 15;
			}
		}
		vsp += 0.5;
	}
	
	if character == "MS" && vsp < 8
	{
		freefallsmash = 0;
		vsp = 12;
		sprite_index = spr_bodyslamfall;
	}
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
		sprite_index = spr_bodyslamfall;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerSP_poundcancel1)
		sprite_index = spr_poundcancel1;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_shotgunjump1)
		sprite_index = spr_shotgunjump3;
	
	landAnim = true;
	move = key_left + key_right;
	if (!grounded)
	{
		if (sprite_index != spr_rockethitwall)
			hsp = move * movespeed;
		else
			hsp = 0;
		if (move != xscale && momemtum == 1 && movespeed != 0)
			movespeed -= 0.05;
		if (movespeed == 0)
			momemtum = false;
		if (move != dir && move != 0)
		{
			dir = move;
			movespeed = 0;
		}
		if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
		{
			movespeed = 0;
			mach2 = 0;
		}
		if (move != 0 && movespeed < 7)
			movespeed += 0.25;
		if (movespeed > 7)
			movespeed -= 0.05;
		if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
			movespeed = 0;
		if (move != 0 && sprite_index != spr_poundcancel1)
			xscale = move;
		
		// cancel out
		/*
		if key_slap2 && character == "SP"
		{
			input_buffer_slap = 0;
			input_buffer_grab = 0;
			
			landAnim = false;
			mach2 = 35;
			momentum = true;
			jumpstop = true;
			dir = xscale;
			
			sound_play_3d("event:/modded/sfx/kungfu", x, y)
			movespeed = 10
			sprite_index = spr_mach2jump
			
			/*
			with instance_create(x, y, obj_mach3effect)
			{
				hspeed = 0;
				
				playerid = other.object_index
				image_index = other.image_index - 1
				image_xscale = other.xscale
				sprite_index = other.sprite_index
			}
			with instance_create(x, y, obj_mach3effect)
			{
				hspeed = -10;
				
				playerid = other.object_index
				image_index = other.image_index - 1
				image_xscale = other.xscale
				sprite_index = other.sprite_index
			}
		
			flash = true
			state = states.mach2
			vsp = -7;
		}
		*/
	}
	
	if (vsp > 0 or !IT_FINAL)
		freefallsmash++;
	else if (vsp < 0)
		freefallsmash = -14;
	
	if (freefallsmash >= 10 && !instance_exists(superslameffectid))
	{
		with (instance_create(x, y, obj_superslameffect))
		{
			playerid = other.object_index;
			other.superslameffectid = id;
		}
	}
	
	var top = bbox_top, bottom = bbox_bottom;
	if flip > 0
	{
		bottom += vsp + 6;
		top += 1;
	}
	else
	{
		top -= vsp + 6;
		bottom -= 1;
	}
	
	if (grounded && vsp >= 0 && (freefallsmash < 10 || !place_meeting(x, y + vsp, obj_metalblock))
	&& (!collision_rectangle(bbox_left, top, bbox_right, bottom, obj_destructibles, false, false) or !IT_FINAL)
	&& (!place_meeting(x, y + 1, obj_ladder) or !REMIX or !key_down or check_solid(x, y + 1)))
	{
		var slope = check_slope(x, y + 1, true);
		if (slope && IT_FINAL)
		{
			with slope
			{
				if global.eggplantslope
					other.movespeed = max(other.freefallsmash * 0.6, 6);
				else
				{
					if other.freefallsmash > 20
						other.movespeed = 12;
					else
						other.movespeed = 8;
				}
				
				other.xscale = -sign(image_xscale);
				if other.character == "S"
				{
					other.state = states.normal;
					other.substate = states.tumble;
					other.movespeed *= other.xscale;
				}
				else
					other.state = states.tumble;
				other.sprite_index = other.spr_crouchslip;
				
				particle_set_scale(part.jumpdust, -sign(image_xscale), 1);
				create_particle(other.x, other.y, part.jumpdust);
			}
		}
		else
		{
			sound_play_3d(sfx_groundpound, x, y);
			if (sprite_index == spr_poundcancel1 or sprite_index == spr_playerSP_poundcancel1)
				sprite_index = spr_poundcancel2;
			else if (shotgunAnim == 0)
				sprite_index = spr_bodyslamland;
			else
				sprite_index = spr_shotgunjump2;
			image_index = 0;
			state = states.freefallland;
			jumpAnim = true;
			jumpstop = false;
			shake_camera(5, 15 / room_speed);
			if (freefallsmash >= 10)
			{
				with (obj_baddie)
				{
					if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
					{
						state = states.stun;
						if (stunned < 60)
							stunned = 60;
						vsp = -11;
						image_xscale *= -1;
						hsp = 0;
						momentum = 0;
					}
				}
				shake_camera(10, 30 / room_speed);
				combo = 0;
				bounce = false;
			}
			create_particle(x, y + 3, part.groundpoundeffect, 0);
			freefallstart = 0;
		}
	}
	image_speed = 0.35;
	if (sprite_index == spr_bodyslamstart)
		image_speed = 0.4;
	if (character == "M")
	{
		if (!key_down)
		{
			state = states.jump;
			sprite_index = spr_fall;
			image_index = 0;
		}
	}
}
