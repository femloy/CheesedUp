if !(global.snickrematch && global.snickchallenge)
{
	instance_destroy(id, false)
	exit
}

event_inherited();
x = room_width / 1.5
cantp = room_speed * 3
