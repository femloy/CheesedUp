function room_is_secret(_room)
{
	if is_string(_room)
	{
		var r = ds_map_find_value(global.cyop_room_map, _room);
		if is_undefined(r)
			return false;
		return global.cyop_rooms[r][0] == room && instance_exists(obj_ghostcollectibles);
	}
	else
		return string_last_pos("_secret",  room_get_name(_room)) > 0 or _room == tower_soundtest or _room == tower_soundtestlevel or (room == _room && instance_exists(obj_ghostcollectibles));
}
