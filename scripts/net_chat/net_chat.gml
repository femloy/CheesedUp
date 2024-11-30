global.online_messages = ds_list_create();
function net_send_chat_message(text)
{
	if live_call(text) return live_result;
	
	var mid = ds_list_size(global.online_messages);
	net_request("chat_message", {
		message: text,
		message_id: mid
	}, function(packet)
	{
		with global.online_messages[| packet.message_id]
		{
			name = packet.username;
			text = packet.message;
			pending = false;
			added = current_time;
			name_color = net_parse_css_color(packet.name_color);
		}
	});
	net_add_chat_message(obj_netclient.username, text, true);
}
function net_add_chat_message(name, text, pending = false)
{
	if live_call(name, text, pending) return live_result;
	
	var c = c_white;
	online {
		if admin c = #FFD36B;
	}

	var msg = {
		name: name,
		text: text,
		pending: pending,
		added: current_time,
		name_color: c,
	};
	ds_list_add(global.online_messages, msg);

	return msg;
}
function net_clear_chat()
{
	ds_list_clear(global.online_messages);
}
