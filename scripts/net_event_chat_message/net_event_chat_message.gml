function net_event_chat_message(packet) {
	if !object_exists(obj_chatshell) exit;
	ds_list_add(obj_chatshell.messages, packet);
}