live_auto_call;

function net_event_player_data(packet)
{	
	if live_call(packet) return live_result;

	online if ds_map_exists(players, packet.uuid)
		net_copy(packet, players[? packet.uuid]);
}