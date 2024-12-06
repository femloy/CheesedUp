function net_event_dresser(packet) {
	online
	{
		var player = players[$ packet.uuid];
		if player != undefined
			net_copy(packet, player);
	}	
}