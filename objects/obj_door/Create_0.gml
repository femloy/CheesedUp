image_speed = 0.35;
visited = false;
depth = 103;
group_arr = noone;
offload_arr = noone;
locked = false;
john = false;
uparrowID = scr_create_uparrowhitbox();

if room == tower_5
{
	if global.panic
	{
		with obj_door
			instance_create(x + 50, y + 96, obj_rubble);
		with obj_bossdoor
			instance_create(x + 50, y + 96, obj_rubble);
	}
}

compatibility = false;
old = false;
spr_blocked = spr_doorblocked;
spr_visited = spr_doorvisited;
alarm[0] = 1;
