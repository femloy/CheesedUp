if !in_saveroom()
{
	instance_create(x, y, obj_bangeffect);
	with (instance_create(x, y, obj_pizzaslice))
		hsp = 2;
	with (instance_create(x, y, obj_pizzaslice))
		hsp = -2;
	repeat (6)
	{
		with (instance_create(x, y, obj_debris))
		{
			vsp = -5;
			sprite_index = spr_tvdebris;
		}
	}
	add_saveroom();
}
