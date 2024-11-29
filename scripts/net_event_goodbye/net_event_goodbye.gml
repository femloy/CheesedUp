function net_event_kick(packet)
{
	show_message(packet.reason);
	obj_netclient.connection = noone;
}
