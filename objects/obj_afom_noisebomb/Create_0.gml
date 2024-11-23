if box
{
	event_inherited();
	buffer = 300;
	step = 0;
	replacemusic = true;
	escape = true;
	sprite_index = spr_noisebomb_walk;
}
else
{
	image_speed = 0.35;
	followQueue = ds_queue_create();
	hsp = 0;
	vsp = 0;
	grav = 0.23;
	movespeed = 3;
	playerid = obj_player1;
}
