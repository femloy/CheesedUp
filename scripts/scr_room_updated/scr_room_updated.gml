function scr_room_updated(_room)
{
	if (_room == room or (room == live_blank_room && live_live_room == _room))
	&& instance_exists(obj_player)
	{
		with obj_player1
		{
			hallway = savedhallway;
			hallwaydirection = savedhallwaydirection;
			vhallwaydirection = savedvhallwaydirection;
			verticalhallway = savedverticalhallway;
		}
		room_goto_live(_room);
	}
}
