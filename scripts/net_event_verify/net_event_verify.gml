function net_event_verify(packet) {
	url_open(packet.url);
	show_message(packet.url);
	obj_netclient.verify_url = packet.url;
	with obj_netchat
	{
		if style.game_paused()
		{
			style.unpause();
			other.alarm[1] = 1;
			exit;
		}
	}
	with obj_loadingscreen
	{
		other.alarm[1] = 1;
		exit;
	}

	wait_popup = popup_net_login(noone, noone);
}