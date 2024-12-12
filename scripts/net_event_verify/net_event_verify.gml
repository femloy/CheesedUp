ptt {

function net_event_verify(packet) {
	net_url_open(packet.url);
    
	obj_netclient.verify_url = packet.url;
    obj_netclient.alarm[0] = -1;
    obj_netclient.alarm[1] = -1;
    
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

	wait_popup = popup_net_login(noone, obj_netclient.verify_callback);
}

}
