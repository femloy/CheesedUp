/// @description Send heartbeat message
net_request("heartbeat", {}, function(res) {
	online {
		alarm[1] = -1;
		if paused net_unpause();
	}
});

if alarm[1] <= 0
	alarm[1] = floor(heart_delay * room_speed);
	
alarm[0] = floor(heart_rate * room_speed);