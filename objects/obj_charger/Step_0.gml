SS_CODE_START;

switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.charge:
		hsp = image_xscale * movespeed;
        if substate == 0
        {
            if sprite_index != spr_banana_chargestart
			{
                movespeed = 8;
				
				if !hitboxcreate
				{
					hitboxcreate = true;
					with instance_create(x, y, obj_forkhitbox)
					{
						ID = other.id;
						image_xscale = other.image_xscale;
				        image_index = other.image_index;
				        depth = -1;
				        sprite_index = spr_chargershitbox;
				        mask_index = spr_chargershitbox;
					}
				}
			}
            else
                movespeed = 0;
            if check_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y)
                image_xscale *= -1;
			
            var dir = sign(obj_player1.x - x);
            if (elite or global.stylethreshold >= 3) && image_xscale == -dir && point_distance(x, 0, obj_player1.x, 0) >= 50
            {
                substate = 1;
                sprite_index = spr_banana_chargestart;
                image_index = 0;
				sound_play_3d(sfx_machslideboost, x, y);
            }
        }
        if substate == 1
        {
            movespeed = (1 - (image_index / image_number)) * 8;
            if floor(image_index) == image_number - 1 || movespeed == 0
            {
                image_xscale *= -1;
                movespeed = 8;
                substate = 0;
                sprite_index = spr_banana_charge;
            }
        }
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

var player = instance_nearest(x, y, obj_player);
if player.x > x - 400 && player.x < x + 400 && y <= player.y + 20 && y >= player.y - 20
{
	if x != player.x && grounded
	{
		if state == states.walk
		{
			fmod_event_instance_play(chargesnd);
			sound_instance_move(chargesnd, x, y);
			state = states.charge;
			movespeed = 0;
			sprite_index = spr_banana_chargestart;
			image_index = 0;
		}
	}
}
if sprite_index == spr_banana_chargestart && floor(image_index) == image_number - 1
    sprite_index = spr_banana_charge
if state == states.stun || state == states.walk
	movespeed = 0;

SS_CODE_END;
