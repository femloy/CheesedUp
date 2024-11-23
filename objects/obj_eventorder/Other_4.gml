for(var i = 0; i < array_length(room_order); i++)
{
	with room_order[i]
		event_perform(ev_other, ev_room_start);
}
