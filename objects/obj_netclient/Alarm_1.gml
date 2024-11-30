/// @description Disconnect if heartbeat fails
if connection != noone
	net_log("Lost connection to the server. Attempting to reconnect.");
if not paused net_pause();

alarm[2] = 1;