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
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
	case states.pizzaheadjump:
		scr_enemy_pizzaheadjump();
		break;
}
stunned = 100;
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
scr_boundbox();
