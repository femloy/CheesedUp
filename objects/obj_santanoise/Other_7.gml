if !in_baddieroom()
{
	add_baddieroom();
	instance_create(x, y, obj_bombexplosion);
	instance_destroy();
}
