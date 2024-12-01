/// @description Disconnect if heartbeat fails
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
wait_popup = popup_net_reconnect(method(self, recon));
