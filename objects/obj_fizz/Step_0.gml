/// @description TODO
SS_CODE_START;

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
	
	case states.float:
		hsp = 0
		image_speed = 0.35
		
		if substate == 0
		{
			vsp = 0
			if !scr_solid(x, y - 1) && y > ystart
				y--
			if !scr_solid(x, y + 1) && y < ystart
				y++
		}
		if check_solid(x + sign(hsp), y)
			image_xscale *= -1
		
		if sprite_index = spr_thundercloud_throw
			sprite_index = walkspr
		break;
}

scr_enemybird();
scr_scareenemy();
scr_boundbox();

SS_CODE_END;
