function scr_event_position(packet)
{
	if packet.room != undefined
		room_goto(packet.room);

	with obj-player1
		net_copy(packet, self);
}