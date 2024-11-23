if (!in_baddieroom() && important == 0)
{
	if (global.golfhit < 10)
	{
		repeat (10)
		{
			with (instance_create(x, y, obj_pizzaslice))
				vsp = random_range(-1, -10);
		}
		global.golfhit = 0;
	}
	else if (global.golfhit < 20)
	{
		repeat (5)
		{
			with (instance_create(x, y, obj_pizzaslice))
				vsp = random_range(-1, -10);
		}
		global.golfhit = 0;
	}
	else if (global.golfhit < 30)
	{
		repeat (1)
		{
			with (instance_create(x, y, obj_pizzaslice))
				vsp = random_range(-1, -10);
		}
		global.golfhit = 0;
	}
	else
		global.golfhit = 0;
	add_baddieroom();
	obj_tv.image_index = random_range(0, 4);
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
