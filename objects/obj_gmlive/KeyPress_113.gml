live_rooms = !live_rooms;
if !live_rooms
{
	for(var i = 0; room_exists(i); i++)
		room_set_live(i, false);
}
else
	room_set_live(room, true);

trace("live_rooms ", live_rooms);
