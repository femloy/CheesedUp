function net_event_create_player(packet)
{
	online
	{
		if ds_map_exists(players, packet.uuid) {
			instance_destroy(players[? packet.uuid]);
			ds_map_delete(players, packet.uuid);
		}
		
		net_log("Creating client '" + packet.uuid + "'");
		players[? packet.uuid] = instance_create(packet.x, packet.y, obj_otherplayer);
		net_copy(packet, players[? packet.uuid]);
	}
}