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
		state = states.float;
		substate = 0;
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
	
	case states.float:
		hsp = 0
		image_speed = 0.35
		
		if check_solid(x + sign(hsp), y)
			image_xscale *= -1
		
		// Froth Diving
		var _dir = (player.x - x)
		if substate == 0
		{
			vsp = 0
			if abs(_dir) <= 250 && sprite_index != spr_snowcloudnotice
			{
				image_index = 0
				sprite_index = spr_snowcloudnotice
			}
			if abs(_dir) > 250 && sprite_index == spr_snowcloudnotice
			{
				image_index = 0
				sprite_index = spr_snowcloudnotice_reverse
			}
			if image_index >= image_number - 1
			{
				if sprite_index = spr_snowcloudnotice 
					image_index = image_number - 2
				if sprite_index = spr_snowcloudnotice_reverse	
					sprite_index = spr_snowcloudwalk	
			}
			if abs(_dir) < 90 && y == ystart && !collision_line(x, y, player.x, player.y, obj_solid, true, false) && player.y >= y
			{
				substate = 1
				vsp = 0
				image_index = 0
				sprite_index = spr_snowclouddive
			}
			y = Approach(y, ystart, 2);
		}
		
		if substate == 1
		{
			vsp += 0.5

			if sprite_index == spr_snowclouddive && image_index >= image_number - 1
				sprite_index = spr_snowclouddiveboil
			if sprite_index == spr_snowclouddiveboil && place_meeting(x, y + 1, player)
			{
				with player
				{
					hsp = 0
					player_x = x
					state = states.frothstuck
					sprite_index = spr_player_frothstuck
					breakout = 3
				}
				instance_destroy()
			}
			if grounded
			{
				substate = 0
				sprite_index = spr_snowcloudwalk
			}
		}
		break;
}
if state == states.float
	grav = 0;
else
	grav = 0.5;

scr_enemybird();
scr_scareenemy();
scr_boundbox();

SS_CODE_END;
