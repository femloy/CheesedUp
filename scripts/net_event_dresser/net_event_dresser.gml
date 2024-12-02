function net_event_dresser(packet) 
{
	online
	{
		var p = players[$ packet.uuid];
		if p != undefined
			net_copy(packet, p);
	}
}