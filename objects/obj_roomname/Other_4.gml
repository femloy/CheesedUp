global.roommessage = string_upper(global.roommessage);
showtext = true;
alarm[0] = 200;
level = false;

var r = string_letters(room_get_name(room));
if room != tower_soundtest && r != "towertutorial" && r != "towertutorialN" && r != "towerup" && (string_copy(r, 1, 5) == "tower" || (string_starts_with(r, "streethouse") && REMIX)) && !global.panic
{
	if string_starts_with(r, "streethouse")
		level = true;
	visible = true;
}
else if (global.roomnames or instance_exists(obj_cyop_loader)) && (ds_list_find_index(seen_rooms, room) < 0 or !REMIX)
{
	level = true;
	if REMIX
	{
		ds_list_add(seen_rooms, room);
		
		if global.roommessage == msg
			visible = false;
		else
			visible = true;
	}
	else
		visible = true;
}
else
{
	visible = false;
	yi = -50;
	showtext = false;
}
msg = global.roommessage;
