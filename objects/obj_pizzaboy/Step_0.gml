if (room == rm_editor)
	exit;

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
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state == states.walk)
	state = states.idle;
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}

if global.stylethreshold >= 3 && state != states.hit && state != states.grabbed
{
	var player = instance_nearest(x, y, obj_player);
	if player && abs(player.x - x) < 50 + abs(player.movespeed) * 2 && abs(player.y - y) < 100
	{
		var xp = x, yp = y;
		
		x -= player.xscale * irandom_range(200, 400);
		while scr_solid(x, y)
			y--;
		while !scr_solid(x, y + 1) && y < room_height
			y++;
		
		image_xscale = sign(player.x - x);
		vsp = -4;
		
		if !bbox_in_camera()
		{
			x = xp;
			y = yp;
			
			vsp = -20;
		}
		else
		{
			global.combotime = 60;
			global.heattime = 60;
			
			var n = 5;
			for(var i = 0; i < n; i++)
			{
				with create_red_afterimage(lerp(xp, x, i / n), lerp(yp, y, i / n), sprite_index, image_index, image_xscale)
					alpha = lerp(0.35, 1, i / n);
			}
		}
	}
}
