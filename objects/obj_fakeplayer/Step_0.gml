with obj_player1
{
	if y <= other.y
		other.active = true;
	if y > other.y + 100 && !other.move
		other.active = false;
}
if !active
	exit;

with obj_secrettile
{
	if place_meeting(x, y, other)
	{
		revealed = true;
		active = true;
	}
}

if move
{
	sprite_index = spr_player_move;
	if movespeed < 8
		movespeed += 0.5;
	
	if movespeed < 3 && move != 0
		image_speed = 0.35;
	else if movespeed > 3 && movespeed < 6
		image_speed = 0.45;
	else
		image_speed = 0.6;
	
	x += movespeed * xscale;
	
	if steppybuffer > 0
		steppybuffer--;
	else
	{
		create_particle(x, y + 43, part.cloudeffect, 0);
		steppybuffer = 12;
		sound_play_3d("event:/sfx/pep/step", x, y);
	}
	
	if x > room_width
		instance_destroy();
}
else
	image_speed = 0.35;

if bbox_in_camera() && !move
{
	if alarm[0] == -1
		alarm[0] = room_speed;
}
else
	alarm[0] = -1;
