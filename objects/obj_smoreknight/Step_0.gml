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
}

scr_enemybird();
scr_scareenemy();
scr_boundbox(true);

if (hitboxcreate == 0 && state == states.walk)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
		ID = other.id;
}

SS_CODE_END;
