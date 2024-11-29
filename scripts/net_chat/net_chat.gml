global.online_messages = ds_list_create();
function net_send_chat_message(name, text)
{
	if live_call(name, text) return live_result;
	
	var mid = ds_list_size(global.online_messages);
	net_request("chat_message", {
		name: name,
		message: text,
		message_id: mid
	}, function(packet)
	{
		with global.online_messages[| packet.message_id]
		{
			name = packet.name;
			text = packet.message;
			pending = false;
			added = current_time;
			name_color = net_parse_css_color(packet.name_color);
		}
	});
	net_add_chat_message(name, text, true);
}
function net_add_chat_message(name, text, pending = false)
{
	if live_call(name, text, pending) return live_result;
	
	with obj_netchat
	{
		var msg = {
			name: name,
			text: text,
			pending: pending,
			added: current_time,
			name_color: obj_netclient.admin ? #FFD36B : c_white
		};
		ds_list_add(global.online_messages, msg);
	}
	return msg;
}
function net_clear_chat()
{
	ds_list_clear(global.online_messages);
}
