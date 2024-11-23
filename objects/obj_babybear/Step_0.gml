SS_CODE_START;

movespeed = 5;
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
scr_boundbox();

var player = instance_nearest(x, y, obj_player);
if ragecooldown > 0
    ragecooldown--;
if point_in_rectangle(player.x, player.y, x - 200, y - 50, x + 200, y + 50) && !player.cutscene
{
    if state == states.walk && ragecooldown <= 0
    {
        state = states.rage;
        sprite_index = ragespr;
        if x != player.x
            image_xscale = -sign(x - player.x);
        ragecooldown = 100;
        image_index = 0;
        image_speed = 0.35;
        flash = true;
        alarm[4] = 5;
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
    }
}

SS_CODE_END;
