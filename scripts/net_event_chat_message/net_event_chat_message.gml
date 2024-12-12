ptt {

function net_event_chat_message(packet)
{
	with net_add_chat_message(packet.username, packet.message)
	{
		name_color = net_parse_css_color(packet.name_color);
	}
}

}
