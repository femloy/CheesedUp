if !(global.snickrematch && global.snickchallenge)
{
	instance_destroy(id, false);
	exit;
}

event_inherited();
x = room_width / 3
y = room_height + 10

cantp = room_speed * 3

if room == dungeon_10 or room == dungeon_9 or room == snick_challengeend
	maxspeed = 2.5
else
	maxspeed = 1

if room == snick_challengeend
	y = -50;
