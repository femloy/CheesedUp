if !in_saveroom()
{
	instance_create(x, y, obj_canonexplosion);
	add_saveroom();
}
