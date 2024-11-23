if !in_baddieroom()
{
	instance_create(x, y, obj_bombexplosion);
	global.miniboss = false;
	add_baddieroom();
	instance_destroy(obj_baddiespawner);
	instance_destroy(obj_doorblocked);
	instance_destroy(obj_iceblockminiboss);
}
