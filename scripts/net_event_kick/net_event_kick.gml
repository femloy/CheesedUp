function net_event_kick(packet) 
{
	show_message("You were kicked!\n Reason: '" + packet.reason + "'");
}