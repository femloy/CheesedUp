function scr_door_spawnpos(door_obj)
{
	if !instance_exists(door_obj)
	{
		trace("Door ", door_obj, " did not exist");
		return [x, y];
	}
	
	var _x = x;
	var _y = y;
	
	if hallway && !global.in_cyop
		_x = door_obj.x + (hallwaydirection * 100);
	else if box
		_x = door_obj.x + 32;
	else
		_x = door_obj.x + 16;
		
	_y = door_obj.y - 14;
	if hallway && flip < 0
	{
		var hall_obj = noone;
		with door_obj
			hall_obj = instance_place(x, y, obj_hallway);
			
		if hall_obj
		{
			_y = hall_obj.y + 46;
			while !scr_solid(x, y + 1) && !place_meeting(x, y, hall_obj)
				_x -= hallwaydirection;
		}
	}
	
	return [_x, _y];
}
