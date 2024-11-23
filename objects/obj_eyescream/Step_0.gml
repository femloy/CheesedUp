/// @description its just a flying charcherry
SS_CODE_START;

var player = instance_nearest(x, y, obj_player);
switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
	
	case states.wait: // baddiestate.eyescreamwait
		image_speed = 0.35
	    vsp = 20
		
	    if !global.panic
	        sprite_index = spr_eyescreamsandwich_wait
	    else if grounded && sprite_index != spr_eyescreamsandwich_popout && player.x > x - 400 && player.x < x + 400 && y <= player.y + 60 && y >= player.y - 60
	    {
	        image_index = 0
	        sprite_index = spr_eyescreamsandwich_popout
	    }
		
	    if sprite_index == spr_eyescreamsandwich_popout && image_index >= image_number - 1
	    {
	        state = states.charge;
	        sprite_index = spr_eyescreamsandwich;
	        movespeed = 8;
	        vsp = 0;
	    }
		break;
	
	case states.charge: // baddiestate.eyescream
		switch substate
		{
			case 0:
				var inrange = false;
				var _targetx = player.x - (randomx * player.xscale)
				var _targety = player.y - randomy
				var tgtX = player.x - (player.xscale * randomx)
				var tgtY = player.y - randomy
				var tgtMVSP = distance_to_point(tgtX, tgtY) / 200
				var _d = point_direction(x, y, tgtX, tgtY)
				
				//var _dir = point_direction(x, y, tgtX, tgtY)
				hsp = lengthdir_x(14 * tgtMVSP, _d)
				vsp = lengthdir_y(14 * tgtMVSP, _d)
				x += hsp
				y += vsp
				
				var _dist = point_distance(x, y, _targetx, _targety)
				var _spd = (_dist / 200) * 20
				sprite_index = spr_eyescreamsandwich
				x = Approach(x, _targetx, _spd)
				y = Approach(y, _targety, _spd) + Wave(-5, 5, 5, 5)
				
				if _dist < 50
				{
					inrange = true;
					use_collision = true;
				}
				
				if x != player.x
					image_xscale = -sign(x - player.x)
				
				if timer > 0 
					timer--
				else if inrange
				{
					substate = 2
					vsp = 0
				
					hsp = 0
					image_index = 0
					sprite_index = spr_eyescreamsandwich_divestart
				}
				break
		
			case 1:
				x += hsp
				y += vsp
				vsp += grav
				if y <= targety && vsp < 0
					substate = 0
				break
		
			case 2:
				hsp = 0
				vsp = 0
				if image_index >= image_number - 1 && spr_eyescreamsandwich_divestart
				{
					var tgthsp = point_distance(x, 0, player.x, 0) / 100
					substate = 1
					vsp = 10
					hsp = (6 * tgthsp) * image_xscale
					targety = y
					timer = maxtime
					sprite_index = spr_eyescreamsandwich_dive
				}
				break
		}
		break;
}

scr_enemybird();
scr_scareenemy();
scr_collide();

if state == states.walk
	state = states.charge;
if state != states.wait && use_collision
	scr_boundbox(true);

SS_CODE_END;
