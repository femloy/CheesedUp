function scr_player_ratmountmort()
{
	if live_call() return live_result;
	
	var acc = 0.5;
	var deccel = 0.5;
	var turning_acc = 1;
	var walk_speed = 6;
	var run_speed = 12;
	var run_acc = 0.15;
	
	move = key_left + key_right;
	if state != states.ratmount && substate == states.machslide
		substate = states.normal;
	
	switch state
	{
		default:
			state = states.ratmount;
			break;
		
		case states.ratmount:
			if sprite_index == spr_mort_drillland
			{
				hsp = 0;
				movespeed = 0;
				
				if image_index >= image_number - 1
					sprite_index = spr_mortland;
				image_speed = 0.15;
			}
			else if substate == states.machslide
			{
				movespeed = Approach(movespeed, 0, 0.3);
				hsp = movespeed;
				
				if image_index >= image_number - 1
				{
					if grounded
					{
						xscale *= -1;
						movespeed = xscale * run_speed;
						hsp = movespeed;
						substate = states.normal;
						flash = true;
					}
					else
						image_index = image_number - 1;
				}
				image_speed = 0.35;
			}
			else
			{
				substate = states.normal;
				hsp = movespeed;
			
				if abs(movespeed) < walk_speed
					ratmount_movespeed = walk_speed;
			
				if key_attack
					ratmount_movespeed = Approach(ratmount_movespeed, run_speed, run_acc);
				else
					ratmount_movespeed = Approach(ratmount_movespeed, walk_speed, run_acc * 2);
			
				if move != 0
					movespeed = Approach(movespeed, move * ratmount_movespeed, sign(movespeed) != move ? turning_acc : acc);
				else
					movespeed = Approach(movespeed, 0, deccel);
			
				if (check_solid(x + sign(movespeed), y) or scr_solid_slope(x + sign(movespeed), y))
				&& !(ratmount_movespeed >= run_speed && place_meeting(x + movespeed, y, obj_destructibles))
					movespeed = 0;
			
				if abs(movespeed) > 0
					xscale = sign(movespeed);
			
				if sprite_index == spr_mortland && image_index < image_number - 1
				{
				
				}
				else 
				{
					if ratmount_movespeed >= run_speed
					{
						if sprite_index != spr_mort_mach3
							flash = true;
						sprite_index = spr_mort_mach3;
					}
					else if key_attack && move != 0 && !scr_solid(x + move, y)
						sprite_index = spr_mort_mach2;
					else if abs(movespeed) > 0
						sprite_index = spr_mortwalk;
					else
						sprite_index = spr_mortidle;
				}
				
				if move == -sign(movespeed) && ratmount_movespeed >= run_speed
				{
					sound_play_3d(machslidesnd, x, y);
					image_index = 0;
					sprite_index = spr_mort_machslide3;
					substate = states.machslide;
				}
			
				if input_buffer_jump > 0 && grounded
				{
					vsp = -11;
					input_buffer_jump = 0;
					state = states.ratmountjump;
					sprite_index = spr_mortspawn;
					image_index = 0;
				
					jumpstop = false;
					scr_fmod_soundeffect(jumpsnd, x, y);
					instance_create(x, y, obj_highjumpcloud2);
				}
				else if !grounded
				{
					state = states.ratmountjump;
					sprite_index = spr_mortfall;
				}
			
				if scr_slapbuffercheck()
				{
					scr_resetslapbuffer();
					
					if move != 0
						xscale = move;
					sound_play_3d("event:/modded/sfx/kungfu", x, y);
				
					movespeed = 12 * xscale;
					state = states.ratmountpunch;
					sprite_index = spr_mortprojectile;
					image_index = 0;
				}
				image_speed = 0.35;
			
				if (key_down or scr_solid(x, y)) && abs(movespeed) < 8
					state = states.ratmountcrouch;
			
				ratmount_dotaunt();
			}
			break;
		
		case states.ratmountcrouch:
			movespeed = Approach(movespeed, 4 * move, 1);
			hsp = movespeed;
			
			if move != 0
			{
				xscale = move;
				sprite_index = spr_lonegustavocrouchwalk;
			}
			else
				sprite_index = spr_lonegustavocrouch;
			
			if !key_down && !scr_solid(x, y)
				state = states.ratmount;
			break;
		
		case states.ratmountpunch:
			hsp = movespeed;
			if move == 0
				movespeed = Approach(movespeed, 0, 0.1);
			
			if image_index >= image_number - 1
				state = states.ratmount;
			image_speed = 0.35;
			
			if punch_afterimage > 0
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				create_blue_afterimage(x, y, sprite_index, image_index, xscale);
			}
			
			if move == -xscale && vsp >= 0
			{
				scr_resetslapbuffer();
				xscale = move;
				state = states.ratmountjump;
				image_index = 0;
				sprite_index = spr_player_suplexcancel;
				movespeed = xscale * 8;
				sound_play_3d("event:/sfx/pep/grabcancel", x, y);
			}
			
			if (check_solid(x + xscale, y) or scr_solid_slope(x + xscale, y)) && !place_meeting(x + hsp, y, obj_destructibles)
			{
				if ledge_bump(32)
				{
					sound_play_3d(sfx_bumpwall, x, y);
					state = states.bump;
					sprite_index = spr_lonegustavobump;
					vsp = -6;
					hsp = xscale * -4;
				}
			}
			
			if scr_check_groundpound()
			{
				state = states.ratmountbounce;
				vsp = 4;
				image_index = 0;
				sprite_index = spr_mort_drill;
			}
			break;
		
		case states.ratmountjump:
			hsp = movespeed;
			
			if abs(movespeed) < walk_speed
				ratmount_movespeed = walk_speed;
			if key_attack
				ratmount_movespeed = Approach(ratmount_movespeed, run_speed, run_acc);
			
			if move != 0
				movespeed = Approach(movespeed, move * ratmount_movespeed, acc);
			else
				movespeed = Approach(movespeed, 0, deccel);
				
			if !jumpstop && !key_jump2 && vsp < 0
			{
				vsp /= 3;
				jumpstop = true;
			}
			
			vsp -= grav / 3;
			
			if abs(movespeed) > 0
				xscale = sign(movespeed);
			if scr_solid(x + sign(movespeed), y) && !place_meeting(x + sign(movespeed), y, obj_slope)
				movespeed = 0;
			
			if input_buffer_jump > 0 && doublejump < 8
			{
				vsp = -10 + doublejump / 2;
				input_buffer_jump = 0;
				state = states.ratmountjump;
				sprite_index = spr_mortspawn;
				repeat 2
					create_debris(x, y, spr_feather);
				image_index = 0;
				
				jumpstop = false;
				doublejump++;
				
				sound_play_3d(sfx_mortdoublejump, x, y);
			}
			
			if key_jump2
				vsp = min(vsp, 3);
			
			if sprite_index == spr_mortspawn && image_index >= image_number - 1
				sprite_index = spr_mortfall;
			
			if grounded && vsp >= 0
			{
				sprite_index = spr_mortland;
				state = states.ratmount;
				
				sound_play_3d(sfx_playerstep, x, y);
				instance_create(x, y, obj_landcloud);
			}
			
			if scr_slapbuffercheck()
			{
				scr_resetslapbuffer();
				sound_play_3d("event:/modded/sfx/kungfu", x, y);
				
				if move != 0
					xscale = move;
				movespeed = 12 * xscale;
				vsp = min(vsp, -4);
				state = states.ratmountpunch;
				sprite_index = spr_mortprojectile;
				image_index = 0;
			}
			
			if scr_check_groundpound()
			{
				state = states.ratmountbounce;
				vsp = -6;
				
				sprite_index = spr_mort_drillstart;
				image_index = 0;
			}
			ratmount_dotaunt();
			break;
		
		case states.ratmountbounce:
			freefallsmash++;
			if vsp > 0
				vsp = Approach(vsp, 40, vsp < 20 ? 1 : 0.5);
			
			if sprite_index == spr_mort_drillstart && image_index >= image_number - 1
				sprite_index = spr_mort_drill;
			
			movespeed = Approach(movespeed, move * walk_speed, acc);
			hsp = movespeed;
			
			if grounded && vsp >= 0 && scr_solid(x, y + 1)
			{
				shake_camera(3);
				create_particle(x, y + 2, part.groundpoundeffect);
				sound_play_3d(sfx_groundpound, x, y);
				sprite_index = spr_mort_drillland;
				image_index = 0;
				state = states.ratmount;
			}
			break;
		
		case states.ratmounthurt:
			sprite_index = spr_mortdead;
			hsp = movespeed;
			if grounded && vsp >= 0
			{
				state = states.ratmount;
				movespeed = 0;
			}
			image_speed = 0.35;
			break;
	}
}
