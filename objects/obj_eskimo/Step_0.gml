SS_CODE_START;

switch state
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
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
}

scr_enemybird();
scr_scareenemy();
scr_boundbox();

// shoot
if bombreset > 0
	bombreset--;

var targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1.id;
if x != targetplayer.x && state != states.pizzagoblinthrow && bombreset <= 0 && grounded && targetplayer.state != states.chainsaw
{
	if targetplayer.x > x - 400 && targetplayer.x < x + 400 && y <= targetplayer.y + 60 && y >= targetplayer.y - 60
	{
		if state == states.walk || (state == states.idle && sprite_index != scaredspr)
		{
			sprite_index = spr_eskimo_throw;
			image_index = 0;
			image_xscale = -sign(x - targetplayer.x);
			state = states.pizzagoblinthrow;
		}
	}
}

SS_CODE_END;
