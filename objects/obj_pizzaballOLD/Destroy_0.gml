if (!in_baddieroom() && important == 0)
{
	obj_camera.targetgolf = noone;
	var _repeat = 10;
	if (global.golfhit < 10)
		_repeat = 10;
	else if (global.golfhit < 20)
		_repeat = 5;
	else if (global.golfhit < 30)
		_repeat = 1;
	else
		_repeat = 0;
	with (instance_create(player.x, player.y, obj_onebyone))
	{
		depth = other.player.depth;
		targetplayer = other.player.id;
		_times = _repeat;
		content = obj_pizzaslice;
		sprite_index = spr_pizzaslice;
		timer = 10;
		alarm[0] = timer;
	}
	global.golfhit = 0;
	add_baddieroom();
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	shake_camera(3, 3 / room_speed);
	instance_create(x, y + 30, obj_bangeffect);
	shake_camera(5, 20 / room_speed);
	hsp = 0;
	vsp = 0;
}
