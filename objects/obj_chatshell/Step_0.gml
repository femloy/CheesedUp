if !open exit;

message_box += keyboard_string;
keyboard_string = "";

if keyboard_check_pressed(vk_enter) && string_length(string_trim(message_box)) > 0 {
	send_message(string_trim(message_box));
	message_box = "";
}

if keyboard_check_pressed(vk_backspace) {
	message_box = string_delete(message_box, string_length(message_box) - 1, 1);
}

if keyboard_check_pressed(vk_tab)
	open = !open;