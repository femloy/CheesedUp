warbg_init();
if global.laps >= 3 && global.leveltosave == "war"
{
	if ds_list_find_value(lap4rooms, room) == -1
	{
		addseconds += 10;
		alarm[0] = -1;
		alarm[2] = 1;
		ds_list_add(lap4rooms, room);
	}
}
