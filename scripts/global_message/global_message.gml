function global_message(message = "(error)", author = "Global Message", time = room_speed * 5)
{
	with obj_persistent
	{
		gotmessage.message = message;
		gotmessage.author = author;
		gotmessage.time = time;
		
		sound_play_centered(sfx_spin);
	}
}
