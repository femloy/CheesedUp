ptt {

function net_event_delete_player(packet)
{
	online
	{
		trace("Deleting player ", packet.uuid);
		var player = players[$ packet.uuid];
		if player != undefined
		{
			instance_destroy(player);
			struct_remove(players, packet.uuid);
		}
		else
			trace("Failed. Sorry!");
	}
}

}
