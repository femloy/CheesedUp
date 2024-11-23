x = playerid.x;
y = playerid.y;

if !instance_exists(obj_pizzaface_thunderdark) && global.stylethreshold < 2
{
	visible = false;
	is_visible = false;
}
else
{
	visible = playerid.visible;
	is_visible = true;
	
	alpha = 0.2;
	if global.stylethreshold >= 2
		alpha = 0.25;
	if global.stylethreshold >= 3
		alpha = 0.5;
}

if room == rank_room
	visible = false;

Vspeed = random_range(-1, 1);
Hspeed = random_range(-1, 1);
alarm[0] = 10;
