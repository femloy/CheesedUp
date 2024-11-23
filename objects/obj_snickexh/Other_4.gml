if !(global.snickrematch && global.snickchallenge)
{
	instance_destroy(id, false);
	exit;
}

event_inherited();
x = room_width / 3
y = -200

appear = 0
appeartimer = (room_speed * 10);
gotoplayer = (room_speed * 5);
