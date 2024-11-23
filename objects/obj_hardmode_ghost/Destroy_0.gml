live_auto_call;

if room == rank_room
{
	x = obj_player.x;
	y = obj_player.y;
	with instance_create(x, y, obj_shakeanddie)
		sprite_index = spr_pizzamancer_death;
}
