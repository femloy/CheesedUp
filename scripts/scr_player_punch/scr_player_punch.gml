function scr_player_punch()
{
	//if live_call() return live_result;
	
	#region uppercut
	
	if (sprite_index == spr_breakdanceuppercut or sprite_index == spr_breakdanceuppercutend)
	{
		move = key_left + key_right;
		landAnim = true;
		jumpstop = false;
		image_speed = 0.4;
		hsp = movespeed;
		
		if move != 0
		{
			dir = move;
			if global.uppercut && movespeed != 0
			{
				if move > 0
					movespeed = Approach(movespeed, max(move * 4, movespeed), 0.6);
				else
					movespeed = Approach(movespeed, min(move * 4, movespeed), 0.6);
			}
			else
				movespeed = Approach(movespeed, move * 4, 0.5);
		}
		else
			movespeed = Approach(movespeed, 0, 0.5);
		
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_breakdanceuppercut)
			sprite_index = spr_breakdanceuppercutend;
		if (grounded && vsp > 0 && (sprite_index == spr_breakdanceuppercut or sprite_index == spr_breakdanceuppercutend))
		{
			if (hsp != 0)
			{
				dir = sign(hsp);
				xscale = dir;
			}
			movespeed = abs(movespeed);
			state = states.normal;
		}
		
		if (punch_afterimage > 0)
			punch_afterimage--;
		else if (vsp < 0 or global.afterimage == AFTERIMAGES.blue) && IT_blue_afterimage()
		{
			punch_afterimage = 5;
			with create_blue_afterimage(x, y, sprite_index, image_index, xscale)
			{
				playerid = other.id;
				vertical = true;
			}
		}
		
		// quick fall
		if global.uppercut && key_down && vsp < 10 && !place_meeting(x, y, obj_ventilator)
			vsp = 10;
		
		// vigilante
		if character == "V"
		{
			scr_vigi_throw();
			
			static vigi_shootbuffer = 0;
			static vigi_dir = 0;
		
			if vigi_shootbuffer > 0
				vigi_shootbuffer--;
			else
			{
				var angle = 255;
				var target_point = noone;
				
				with obj_baddie
				{
					var disx = (x - other.x);
					if abs(disx) < 150 && other.y < y - 150 && !collision_line(x, y, x, other.y, obj_solid, false, false)
					{
						target_point = id;
						break;
					}
				}
				
				if target_point == noone
				{
					switch vigi_dir
					{
						case 1:
							angle = 270;
							break;
						case 2:
							angle = 285;
							break;
						case 3:
							angle = 270;
							break;
					}
					vigi_dir++;
					if vigi_dir > 3
						vigi_dir = 0;
				}
				else
					angle = point_direction(x, y, target_point.x + target_point.hsp, target_point.y);
				
				with instance_create(x, y, obj_uziprojectile_player)
				{
					sound_play_3d("event:/sfx/vigilante/uzishoot", x, y);
					hsp = lengthdir_x(spd, angle);
					vsp = lengthdir_y(spd, angle);
				}
				vigi_shootbuffer = 4;
			}
		}
	}
	
	#endregion
	#region breakdance
	
	else if string_pos("breakdance", sprite_get_name(sprite_index))
	or string_pos("buttattack", sprite_get_name(sprite_index))
	{
		hsp = xscale * movespeed;
		
		if sprite_index == spr_breakdancesuper && key_shoot2
			movespeed = 14;
		if movespeed > 0 && sprite_index == spr_breakdancemove && grounded
			movespeed -= 0.25;
		if movespeed > 0 && sprite_index == spr_breakdancesuper
			movespeed -= 0.25;
		
		if sprite_index == spr_breakdancemove && floor(image_index) >= 14
			image_index = 4 + frac(image_index);
		
		if key_shoot2 && move == xscale && sprite_index == spr_breakdancemove
		{
			if IT_final_sounds()
			{
				fmod_event_instance_stop(breakdancesnd, true);
				fmod_event_instance_play(breakdancecancelsnd);
			}
			
			image_index = 0;
			sprite_index = spr_buttattackstart;
			movespeed = max(movespeed, 16);
			vsp = -5;
			
			if !instance_exists(crazyruneffectid)
			{
				with instance_create(x, y, obj_crazyrunothereffect)
				{
					playerid = other.object_index
					other.crazyruneffectid = id
				}
			}
		}
		if floor(image_index) == image_number - 1 && sprite_index == spr_buttattackstart
			sprite_index = spr_buttattack;
		
		if sprite_index == spr_buttattack or sprite_index == spr_buttattackstart
		{
			if grounded && vsp > 0
			{
				if key_attack
				{
					state = states.mach2;
					movespeed = max(movespeed, 6);
				}
				else
					sprite_index = spr_buttattackend;
			}
			else if scr_mach_check_dive() && !IT_old_machroll()
			{
				particle_set_scale(part.jumpdust, xscale, 1);
				create_particle(x, y, part.jumpdust, 0);
				state = states.tumble;
				image_index = 0;
				sprite_index = spr_mach2jump;
				flash = false;
				vsp = 10;
			}
		}
		
		if sprite_index == spr_buttattackend
		{
			movespeed -= 0.25;
			if key_attack
			{
				state = states.mach2;
				sprite_index = spr_rollgetup;
				image_index = 0;
			}
		}
			
		if key_shoot2 && sprite_index == spr_breakdancemove && move == 0
		{
			sprite_index = spr_breakdancesuper;
			movespeed = max(movespeed, 12);
		}
		
		if breakdance > 0
			breakdance--;
		
		landAnim = false;
		if movespeed <= 0 && (sprite_index == spr_breakdancesuper or sprite_index == spr_buttattackend)
			state = states.normal;
		if breakdance <= 0 && sprite_index == spr_breakdancemove
		{
			if key_attack
			{
				state = states.mach2;
				movespeed = max(movespeed, 6);
			}
			else
				state = states.normal;
		}
		if check_solid(x + xscale, y) && sprite_index == spr_breakdancesuper
		{
			sound_play_3d(sfx_mach2bump, x, y);
			sound_play_3d(sfx_pepperman_groundpoundbump, x, y);
			instance_create(x + xscale * 25, y + 35, obj_bumpeffect);
			xscale *= -1;
		}
		
		if sprite_index == spr_breakdancesuper
			image_speed = movespeed / 24;
		else
			image_speed = 0.4;
		
		if scr_solid(x + xscale, y) && !check_slope(x + sign(hsp), y) && !place_meeting(x + xscale, y, obj_destructibles)
		&& (!place_meeting(x + xscale, y, obj_destructibles) or (sprite_index != spr_buttattack && sprite_index != spr_buttattackstart))
		{
			if ledge_bump(32)
			{
				if sprite_index == spr_buttattack or sprite_index == spr_buttattackstart or sprite_index == spr_buttattackend
				{
					sound_play_3d(sfx_bumpwall, x, y);
					vsp = -4;
					sprite_index = spr_kungfujump;
					image_index = 0;
					state = states.punch;
					movespeed = -6;
				}
				else if sprite_index != spr_breakdancesuper
				{
					sound_play_3d(sfx_splat, x, y);
					state = states.bump;
					image_index = 0;
					sprite_index = spr_wallsplat;
				}
			}
		}
		
		if movespeed > 5
		{
			if punch_afterimage > 0
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				with create_blue_afterimage(x, y, sprite_index, image_index, xscale)
					playerid = other.id;
			}
		
			if !instance_exists(obj_dashcloud2) && grounded
			{
				with instance_create(x, y, obj_dashcloud2)
					copy_player_scale(other);
			}
		}
	}
	
	#endregion
	#region kungfu
	
	else
	{
		move = key_left + key_right;
		landAnim = false;
		image_speed = 0.4;
		if breakdance > 0
			breakdance--;
		
		var bump = sprite_index == spr_kungfujump or sprite_index == spr_lungehit;
		if move != 0
		{
			if move != xscale && movespeed > -6
			{
				if !bump
					movespeed -= 1;
				else
					movespeed -= 0.1;
			}
			else if move == xscale && movespeed < 6 && !bump
				movespeed += 0.2;
		}
		hsp = xscale * movespeed;
		
		var _kungfuground = sprite_index == spr_kungfu1 or sprite_index == spr_kungfu2 or sprite_index == spr_kungfu3 or sprite_index == spr_shotgunsuplexdash;
		var _kungfuair = sprite_index == spr_kungfuair1 or sprite_index == spr_kungfuair2 or sprite_index == spr_kungfuair3 or sprite_index == spr_kungfuair1transition or sprite_index == spr_kungfuair2transition or sprite_index == spr_kungfuair3transition;
		var _Sjumpcancel = sprite_index == spr_player_Sjumpcancel or sprite_index == spr_player_Sjumpcancelland or sprite_index == spr_player_Sjumpcancelslide;
		
		if _kungfuground && image_index > 7 && !key_attack && movespeed > 0
			movespeed -= 0.5;
		else if _kungfuground && movespeed <= 12
		{
			movespeed += 0.2;
			if movespeed > 12
				movespeed = 12;
		}
		else if key_attack && move != 0 && REMIX
			movespeed += 0.02;
		
		// double tap move
		if (_kungfuground or _kungfuair) && input_buffer_slap > 0
		{
			input_buffer_slap = 0;
			scr_perform_move(modmoves.doublegrab, states.punch);
			exit;
		}
		
		if _kungfuground && input_buffer_jump > 0 && can_jump
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			input_buffer_jump = 0;
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			jumpstop = false;
			image_index = 0;
			vsp = -11;
			
			if SUGARY_SPIRE && character == "SN"
			{
				// unfun sugary way
				/*
				state = states.punch;
				sprite_index = choose(spr_kungfuair1transition, spr_kungfuair2transition, spr_kungfuair3transition);
				*/
				
				// fun cheesed up way
				state = states.twirl;
				if movespeed > 12
					sprite_index = spr_pizzano_machtwirl;
				else
					sprite_index = spr_pizzano_twirl;
			}
			else if CHAR_POGONOISE
			{
				state = states.jump;
				jumpAnim = true;
			}
			else
			{
				state = states.mach2;
				if character == "P" or spr_longjump != spr_player_longjump
					sprite_index = spr_longjump;
				else
					sprite_index = spr_mach2jump;
			}
			movespeed = max(movespeed, 6);
		}
		else if _kungfuground && vsp < 0
			sprite_index = choose(spr_kungfuair1, spr_kungfuair2, spr_kungfuair3);
		
		if scr_mach_check_dive() && (_kungfuair or _kungfuground) && !IT_old_machroll()
		{
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			state = states.tumble;
			image_index = 0;
			
			if !grounded
			{
				sprite_index = spr_mach2jump;
				flash = false;
				vsp = 10;
			}
			else
			{
				sprite_index = spr_crouchslip;
				movespeed = max(movespeed, 12);
				crouchslipbuffer = 25;
				fmod_event_instance_play(snd_crouchslide);
			}
		}
		if !key_jump2 && jumpstop == 0 && vsp < 0 && _kungfuair
		{
			vsp /= 20;
			jumpstop = true;
		}
		
		if floor(image_index) == image_number - 1
		{
			switch (sprite_index)
			{
				case spr_kungfu1:
				case spr_kungfu2:
				case spr_kungfu3:
				case spr_shotgunsuplexdash:
					/*
					state = states.normal;
					if (move != xscale && move != 0)
						movespeed = 2;
					*/
					if key_attack && !CHAR_POGONOISE
					{
						if move != 0
							xscale = move;
						state = states.mach2;
						movespeed = max(movespeed, 6);
					}
					else
					{
						state = states.normal;
						movespeed = max(movespeed, 0);
					}
					break;
						
				case spr_kungfuair1transition:
					sprite_index = spr_kungfuair1;
					break;
				case spr_kungfuair2transition:
					sprite_index = spr_kungfuair2;
					break;
				case spr_kungfuair3transition:
					sprite_index = spr_kungfuair3;
					break;
				case spr_player_Sjumpcancelland:
					sprite_index = spr_player_Sjumpcancelslide;
					break;
				case spr_lungehit:
					image_index = image_number - 1;
					break;
			}
		}
		if !_kungfuground && !_Sjumpcancel
		{
			if grounded && vsp >= 0 && (image_index >= image_number - 2 or sprite_index != spr_lungehit)
			{
				if key_attack && movespeed > 0 && !CHAR_POGONOISE
				{
					if move != 0
						xscale = move;
					state = states.mach2;
					movespeed = max(movespeed, 6);
				}
				else
				{
					sound_play_3d(landsnd, x, y);
					create_particle(x, y, part.landcloud, 0);
					landAnim = true;
					state = states.normal;
				}
			}
		}
		if _Sjumpcancel
		{
			if grounded && vsp > 0
			{
				if sprite_index == spr_player_Sjumpcancel
				{
					sprite_index = spr_player_Sjumpcancelland;
					image_index = 0;
				}
				if key_attack
				{
					if movespeed >= 12
						state = states.mach3;
					else
						state = states.mach2;
					movespeed = abs(movespeed);
					sprite_index = spr_rollgetup;
					image_index = 0;
				}
				else if movespeed > 6
				{
					state = states.machslide;
					sprite_index = spr_machslidestart;
					image_index = 0;
				}
				else
					state = states.normal;
			}
			if sprite_index == spr_player_Sjumpcancelslide
				image_speed = abs(movespeed) / 15;
		}
		
		if !bump && (check_solid(x + xscale, y - grounded * 16) or scr_solid_slope(x + xscale, y - grounded * 16)) && !check_slope(x, y - 1) && !place_meeting(x + xscale, y, obj_destructibles)
		{
			if ledge_bump(32)
			{
				if (!grounded or scr_slope()) && !CHAR_POGONOISE && IT_grab_climbwall()
				{
					while !scr_solid(x + xscale, y)
						x += xscale;
					hsp = 0;
					
					if !place_meeting(x + hsp, y, obj_unclimbablewall)
						wallspeed = movespeed;
					else
						wallspeed = -vsp;
					grabclimbbuffer = 10;
					state = states.climbwall;
					if REMIX
						vsp = -wallspeed;
				}
				else
				{
					sound_play_3d(sfx_bumpwall, x, y);
					vsp = -4;
					sprite_index = spr_kungfujump;
					image_index = 0;
					state = states.punch;
					movespeed = -6;
				}
			}
		}
		
		if punch_afterimage > 0
			punch_afterimage--;
		else
		{
			punch_afterimage = 5;
			with create_blue_afterimage(x, y, sprite_index, image_index, xscale)
				playerid = other.id;
		}
		
		if !instance_exists(obj_dashcloud2) && grounded && movespeed > 5
		{
			with instance_create(x, y, obj_dashcloud2)
				copy_player_scale(other);
		}
	}
	
	#endregion
}
