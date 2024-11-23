if (room != rank_room)
{
	var r = string_letters(room_get_name(room));
	if global.leveltosave == "tutorial"
		global.tutorial_room = true;
	else
		global.tutorial_room = false;
}
