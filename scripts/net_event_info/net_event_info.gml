ptt {

function net_event_info(packet)
{
	online {
		net_copy(packet, obj_netclient);
		alarm[0] = floor(heart_rate * room_speed);
	}
}

}
