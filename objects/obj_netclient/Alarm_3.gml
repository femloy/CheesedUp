/// @description Reconnecting dots
live_auto_call;

if string_count(".", reconnecting_text) >= heart_delay
	reconnecting_text = "Reconnecting";
else
	reconnecting_text = string_concat(reconnecting_text, ".");

alarm[3] = room_speed;
