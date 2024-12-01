function net_event_delete_player(packet)
{
	online
	{
		if ds_map_exists(players, packet.uuid) {
			instance_destroy(players[? packet.uuid]);
			ds_map_delete(players, packet.uuid);
		}
	}
}