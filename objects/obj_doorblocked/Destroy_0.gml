if !in_baddieroom()
{
	instance_create(x, y, obj_bombexplosion);
	repeat (6)
		instance_create(x, y, obj_wooddebris);
	add_baddieroom();
}
