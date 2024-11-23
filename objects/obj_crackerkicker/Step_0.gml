SS_CODE_START;

switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.charge:
		scr_enemy_charge();
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
}

scr_enemybird();
scr_scareenemy();
scr_boundbox();

if (bombreset > 0)
	bombreset--;
var targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (x != targetplayer.x && state != states.pizzagoblinthrow && obj_player.state != states.tumble && bombreset <= 0 && grounded)
{
	if ((targetplayer.x > (x - 80) && targetplayer.x < (x + 80)) && (y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100)))
	{
		if (state == states.walk)
		{
			image_index = 0;
			sprite_index = spr_crackerkicker_kick;
			image_xscale = -sign(x - targetplayer.x);
			state = states.pizzagoblinthrow;
		}
	}
}
if (grounded && state == states.pizzagoblinthrow && floor(image_index) == 3)
	vsp = -5;
if (kickbuffer > 0)
{
	kickbuffer--;
	invincible = true;
}
else
	invincible = false;

SS_CODE_END;
