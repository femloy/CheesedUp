function net_event_player_data(packet)
{
	online
	{
		trace("UUIDS:");
		var key = ds_map_find_first(players);
		while !is_undefined(key)
		{
			trace(key);
			key = ds_map_find_next(players, key);	
		}
		trace("");
		
		
		if ds_map_exists(players, packet.uuid) 
			net_copy(packet, players[? packet.uuid]);
	}
}