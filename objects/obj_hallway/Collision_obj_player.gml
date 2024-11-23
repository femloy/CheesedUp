with (other)
{
	if (state == states.debugstate)
		exit;
	if (state == states.backtohub or instance_exists(obj_backtohub_fadeout))
		exit;
	if (state == states.titlescreen)
		exit;
	if (instance_exists(obj_jumpscare))
		exit;

	if !other.compatibility
	{
		if (!other.savedposition)
		{
			other.savedposition = true;
			other.savedx = x;
			other.savedy = y;
		}
		x = other.savedx;
		y = other.savedy;
	}
	
	var hall = other;
	if (!instance_exists(obj_fadeout))
	{
		set_lastroom();
		targetDoor = hall.targetDoor;
		targetRoom = hall.targetRoom;
		hallway = true;
		hallwaydirection = hall.image_xscale;
		
		if hall.compatibility
		{
			oldHallway = true;
			player_x = hall.target_x;
			player_y = hall.target_y;
		}
		
		hall.visited = true;
		sound_play("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
		
		if room == targetRoom
		{
			if hall.sameroom
				xscale *= -1;
			obj_fadeout.roomreset = true;
		}
	}
}
