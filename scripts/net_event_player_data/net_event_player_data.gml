function net_event_player_data(packet)
{
	//trace("My balls: ", packet);
	online
	{
		var player = players[$ packet.uuid];
		if player != undefined
			net_copy(packet, player);
	}
}
