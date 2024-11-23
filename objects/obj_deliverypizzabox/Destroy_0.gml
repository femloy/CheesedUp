if !in_saveroom()
{
	add_saveroom();
	instance_create_unique(0, 0, obj_deliverytimer);
	with (obj_deliverytimer)
	{
		minutes = other.minutes;
		seconds = other.seconds;
	}
}
