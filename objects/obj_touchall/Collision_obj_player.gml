if (!touched)
{
	touched = true;
	secret_add_touchall(room, trigger, id);
	add_saveroom();
}
