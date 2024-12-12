ptt {

function net_event_player_data(packet)
{
	online
	{
		var player = players[$ packet.uuid];
		if player != undefined {
			array_push(player.packets, packet);
			if array_length(player.packets) > player.packet_max
				array_shift(player.packets);
			player.packets_this_frame++;
		}
	}
}

}
