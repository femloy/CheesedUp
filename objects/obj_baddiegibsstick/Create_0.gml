image_speed = 0;
init_collision();
storedx = -4;
storedy = -4;
grav = 0.4;
collisioned = false;
depth = -1;
sprite_index = choose(spr_goop, spr_goop2);

if scr_solid(x, y) && !place_meeting(x, y, obj_destructibles)
{
	var dir;
	if !scr_solid(x + 16, y)
		dir = 1;
	else
		dir = -1;
	
	while scr_solid(x, y)
		x += dir;
}
