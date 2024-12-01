function net_event_delete_player(packet)
{
	net_log(packet.uuid);
	online
	{
		if ds_map_exists(players, packet.uuid) {
			net_log("Deleting player '" + packet.uuid + "'");
			instance_destroy(players[? packet.uuid]);
			ds_map_delete(players, packet.uuid);
		}
	}
}