if async_load[? "type"] == "video_start"
{
	with instance_create(0, 0, obj_genericfade)
	{
		fade = 1.2;
		deccel = 0.03;
	}
}
if async_load[? "type"] == "video_end"
	room_goto(Mainmenu);
