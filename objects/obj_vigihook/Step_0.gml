live_auto_call;

sound_instance_move(throwsnd, x, y);
switch state
{
	case 0:
		// grabbable shit
		mask_index = spr_player_mask;
		
		with instance_place(x + hsp + sign(hsp), y + vsp + sign(vsp), obj_hungrypillar)
		{
			mask_index = spr_player_mask;
			sprite_index = angryspr;
			
			other.enemyid = id;
			other.state = 10;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		with instance_place(x, y, obj_baddie)
		{
			if !destroyable or state == states.hit
				break;
			
			use_collision = false;
			state = states.stun;
			stunned = 200;
			other.enemyid = id;
			other.state = 10;
			boundbox = true;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		with instance_place(x, y, obj_electricpotato)
		{
			other.enemyid = id;
			other.state = 10;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		with instance_place(x, y, obj_gerome)
		{
			other.enemyid = id;
			other.state = 10;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		with instance_place(x, y, obj_treasure)
		{
			mask_index = spr_player_mask;
			
			other.enemyid = id;
			other.state = 10;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		with instance_place(x + hsp + sign(hsp), y + vsp + sign(vsp), obj_ratblock)
		{
			mask_index = spr_player_mask;
			sprite_index = spr_dead;
			
			other.enemyid = id;
			other.state = 10;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		with instance_place(x + hsp + sign(hsp), y + vsp + sign(vsp), obj_pizzaboxunopen)
		{
			var xx = other.playerid.x, yy = other.playerid.y;
			
			other.playerid.x = x;
			other.playerid.y = y;
			
			event_perform(ev_step, 0);
			
			other.playerid.x = xx;
			other.playerid.y = yy;
			
			other.enemyid = content;
			other.state = 10;
			
			sound_instance_move(other.hitsnd, x, y);
			fmod_event_instance_play(other.hitsnd);
			
			exit;
		}
		var morthook = instance_place(x, y, obj_morthook);
		if morthook
		{
			with instance_create(morthook.x, morthook.y, obj_morthitbox)
				playerid = other.playerid;
			state = 10;
			exit;
		}
		
		// destroyable shit
		with obj_destructibles
		{
			if place_meeting(x - other.hsp - sign(other.hsp), y - other.vsp - sign(other.vsp), other)
				instance_destroy();
		}
		with instance_place(x + hsp + sign(hsp), y + vsp + sign(vsp), obj_mortblock)
			instance_destroy();
		
		// change directions briefly after shoot
		if buffer > 0
		{
			buffer--;
			with playerid
			{
				var spd = 24, move_v = (key_down - key_up), move_h = (key_right + key_left);
				if move_h != 0 && other.hsp == 0
					other.hsp = move_h * spd;
				if move_v != 0 && other.vsp == 0
					other.vsp = move_v * spd;
			}
		}
		
		// MOVE
		mask_index = sprite_index;
		
		hsp_store = hsp;
		vsp_store = vsp;
		
		scr_collide();
		if scr_solid(x, y)
			state = 10;
		else if (hsp != hsp_store or vsp != vsp_store) && (!place_meeting(x + sign(hsp), y + sign(vsp), obj_slope) or hsp == 0) && !place_meeting(x + hsp, y + vsp, obj_destructibles) && !place_meeting(x + hsp, y + vsp, obj_ratblock) && !place_meeting(x + hsp, y + vsp, obj_mortblock)
		{
			instance_create(x, y, obj_bumpeffect);
			repeat 2
				create_debris(x, y, spr_spark);
			state = 1;
			
			sound_instance_move(hitsnd, x, y);
			fmod_event_instance_play(hitsnd);
			fmod_event_instance_play(pullsnd);
			
			sound_stop(throwsnd);
			trace(hsp, " ", vsp);
			trace(hsp_store, " ", vsp_store);
		}
		else
		{
			hsp = hsp_store;
			vsp = vsp_store;
		}
		
		if !bbox_in_camera(, 200)
			state = 10;
		break;
	
	case 1:
		sound_instance_move(pullsnd, playerid.x, playerid.y);
		
		var spd = 16;
		with playerid
		{
			var dir = point_direction(x, y, other.x, other.y);
			if abs(hsp) < 3
				hsp = lengthdir_x(8, dir);
			else
				hsp = Approach(hsp, lengthdir_x(spd, dir), .5);
			vsp = lengthdir_y(spd, dir);
			
			with instance_place(x + hsp + sign(hsp), y + vsp + sign(vsp), obj_destructibles)
				instance_destroy();
			
			if distance_to_object(other) < 10
			{
				sprite_index = spr_idle;
				other.state++;
				
				var xx = other.x, yy = other.y - 16;
				var xprev = x, yprev = y;
				
				if !scr_solid(xx, y)
					x = xx;
				else if other.hsp_store != 0
				{
					while !scr_solid(x + sign(other.hsp_store), y)
					{
						x += sign(other.hsp_store);
						if x > room_width or x < 0
						{
							x = xprev;
							break;
						}
					}
				}
				
				if !scr_solid(x, yy)
					y = yy;
				else if other.vsp_store != 0
				{
					while !scr_solid(x, y + sign(other.vsp_store))
					{
						y += sign(other.vsp_store);
						if y > room_height or y < 0
						{
							y = yprev;
							break;
						}
					}
				}
				
				with obj_camera
				{
					offset_x = xprev - other.x;
					offset_y = yprev - other.y;
				}
				
				if other.hsp == 0 && other.hsp_store != 0
					sprite_index = spr_playerV_hookwallstart;
				else if other.vsp_store > 0
					sprite_index = spr_idle;
				else
					sprite_index = spr_playerV_hookceilingstart;
				image_index = 0;
				
				trace("otherx: ", other.x, " other.y: ", other.y, " x: ", x, " y: ", y);
				if place_meeting(x + xscale * 10, y, obj_metalblock) && hsp != 0
				{
					movespeed = max(abs(hsp), 12);
					state = states.mach3;
					sprite_index = spr_mach4;
				}
				else
				{
					sound_play_3d(sfx_bumpwall, x, y);
					hsp = 0;
					vsp = 0;
				}
				
				sound_stop(other.pullsnd);
			}
			
			// stuck?
			else if scr_solid(x, y + sign(other.vsp_store))
			{
				/*
				if x - other.x != 0
					hsp = -4 * sign(x - other.x);
				if !scr_solid(x + 16, y)
					hsp = 4;
				else if !scr_solid(x - 16, y)
					hsp = -4;
				else
				*/
				{
					state = states.bump;
					sprite_index = spr_bump;
					sound_play_3d(sfx_bumpwall, x, y);
				}
			}
			else if scr_solid(x + sign(other.hsp_store), y)
			{
				/*
				if y - other.y != 0
					vsp = -4 * sign(y - other.y);
				else if !scr_solid(x, y + 16)
					vsp = 4;
				else if !scr_solid(x, y - 16)
					vsp = -4;
				else
				*/
				{
					state = states.bump;
					sprite_index = spr_bump;
					sound_play_3d(sfx_bumpwall, x, y);
				}
			}
			
			/*else if abs(x - xprevious) == 0 && abs(y - yprevious) == 0
			{
				state = states.bump;
				sprite_index = spr_bump;
				sound_play_3d(sfx_bumpwall, x, y);
			}*/
		}
		break;
	
	case 2:
		
		break;
	
	case 10:
		direction = point_direction(x, y, playerid.x, playerid.y);
		speed += 1;
		
		with enemyid
		{
			destroyable = false;
			with obj_baddiecollisionbox
			{
				if baddieID == other.id
					instance_destroy();
			}
			
			direction = point_direction(x, y, other.playerid.x, other.playerid.y);
			speed += 2;
			
			if object_index != obj_treasure && object_index != obj_ratblock
			{
				if other.playerid.x < x
					image_xscale = -1;
				else
					image_xscale = 1;
			}
			
			if object_index == obj_electricpotato
			{
				other.playerid.hurted = true;
				other.playerid.alarm[7] = 1;
			}
			if object_index == obj_hungrypillar
				sprite_index = angryspr;
			
			if distance_to_object(other.playerid) <= speed
			{
				instance_destroy(other);
				
				speed = 0;
				x = other.playerid.x;
				y = other.playerid.y;
				
				if object_index == obj_treasure
				{
					var yy = other.playerid.y;
					
					event_perform(ev_step, 0);
					other.playerid.y = y;
					event_perform(ev_step, 0);
					other.playerid.y = yy;
					
					y = other.playerid.y - 35;
					effectid.y = y;
				}
				else if object_is_ancestor(object_index, obj_baddie)
				{
					destroyable = true;
					use_collision = true;
					hp = -999;
					x += image_xscale;
					scr_hitstun_enemy(id, 5);
				}
				else if !object_is_ancestor(object_index, obj_pizzakinparent) && object_index != obj_gerome
					instance_destroy();
			}
			exit;
		}
		image_blend = c_ltgray;
		if distance_to_object(playerid) <= speed
		{
			sound_play_3d("event:/sfx/mort/throwcatch", x, y);
			instance_destroy();
		}
		exit;
}
if playerid.state != states.dynamite
	state = 10;
