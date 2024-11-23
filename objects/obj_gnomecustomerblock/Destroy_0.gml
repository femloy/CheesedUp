if !in_saveroom()
{
	add_saveroom();
	instance_create(x, y, obj_ratrunaway);
}
