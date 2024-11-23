function scr_player_ratmountmort()
{
	//if live_call() return live_result;
	
	move = key_left + key_right;
	switch state
	{
		default:
			state = states.ratmount;
			break;
		
		case states.ratmount:
			hsp = movespeed;
			
			if abs(movespeed) < 8
				ratmount_movespeed = 8;
			if key_attack
				ratmount_movespeed = Approach(ratmount_movespeed, 12, 0.15);
			
			if move != 0
				movespeed = Approach(movespeed, move * ratmount_movespeed, 0.5);
			else
				movespeed = Approach(movespeed, 0, 0.5);
			
			if scr_solid(x + sign(movespeed), y) && !place_meeting(x + sign(movespeed), y, obj_slope)
				movespeed = 0;
			
			if sprite_index != spr_mortland or image_index >= image_number - 1
			{
				if abs(movespeed) > 0
				{
					xscale = sign(movespeed);
					sprite_index = spr_mortwalk;
				}
				else
					sprite_index = spr_mortidle;
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
				if move != 0
					xscale = move;
				sound_play_3d("event:/modded/sfx/kungfu", x, y);
				
				movespeed = 12 * xscale;
				state = states.ratmountpunch;
				sprite_index = spr_mortprojectile;
				image_index = 0;
			}
			image_speed = 0.35;
			
			ratmount_dotaunt();
			break;
		
		case states.ratmountpunch:
			hsp = movespeed;
			if move == 0
				movespeed = Approach(movespeed, 0, 0.1);
			
			if image_index >= image_number - 1
				state = states.ratmount;
			image_speed = 0.25;
			
			if punch_afterimage > 0
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				create_blue_afterimage(x, y, sprite_index, image_index, xscale);
			}
			
			if scr_check_groundpound()
			{
				state = states.ratmountgroundpound;
				vsp = 4;
				sprite_index = spr_mortidle;
			}
			break;
		
		case states.ratmountjump:
			hsp = movespeed;
			
			if abs(movespeed) < 8
				ratmount_movespeed = 8;
			if key_attack
				ratmount_movespeed = Approach(ratmount_movespeed, 12, 0.15);
			
			if move != 0
				movespeed = Approach(movespeed, move * ratmount_movespeed, 0.5);
			else
				movespeed = Approach(movespeed, 0, 0.5);
				
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
				
				sprite_index = spr_mortidle;
			}
			ratmount_dotaunt();
			break;
		
		case states.ratmountbounce:
			freefallsmash++;
			if vsp > 0
				vsp = Approach(vsp, 40, vsp < 20 ? 1 : 0.5);
			
			movespeed = Approach(movespeed, move * 2, 0.5);
			hsp = movespeed;
			
			if grounded && vsp >= 0 && scr_solid(x, y + 1)
			{
				sound_play_3d(sfx_groundpound, x, y);
				sprite_index = spr_mortland;
				image_index = 0;
				state = states.ratmount;
			}
			break;
		
		// TODO ladder, hurt
	}
}
