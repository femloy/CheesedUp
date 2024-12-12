/// @description Disconnect if heartbeat fails
ptt {

disconnected = true;

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

var recon = function()
{
	connection = net_disconnect(connection);
	connection = net_connect(address, port);
};

var oncon = function()
{
	instance_activate_object(obj_otherplayer);
	with obj_otherplayer
		instance_destroy();
	players = {};

	net_send_room_change();
	
};
wait_popup = popup_net_reconnect(method(self, recon), method(self, oncon));

}
