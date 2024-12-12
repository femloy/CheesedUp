/// @description Send heartbeat message
ptt {

net_request("heartbeat", { time: current_time }, function(res)
{
	online
	{
		disconnected = false;
		alarm[1] = -1;
	}
});

alarm[0] = floor(heart_rate * room_speed);
if alarm[1] == -1
	alarm[1] = floor(heart_delay * room_speed);

}
