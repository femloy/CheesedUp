if !in_saveroom()
{
	instance_destroy();
	instance_create(x, y, content);
	add_saveroom();
}
