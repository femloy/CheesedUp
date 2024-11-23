function set_lastroom()
{
	with obj_player
	{
		lastroom = room;
		if instance_exists(obj_cyop_loader)
			lastroom = obj_cyop_loader.room_name;
	}
}
