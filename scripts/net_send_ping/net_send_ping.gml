function net_send_ping() {
	trace($"Time Before: {current_time}");
	net_request("ping", {time: real(current_time)}, function(res)
	{
		trace($"Time After: {current_time}");
		net_add_chat_message("Ping", current_time - res.time);
		trace($"{real(current_time)} - {real(res.time)} = {real(current_time - res.time)}");
	});
}