if !in_saveroom()
{
	repeat (7)
		create_debris(x + 32, y + 32, spr_johndestructible_debris);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
	with (instance_create(x, y, obj_johnghost))
		playerid = instance_nearest(x, y, obj_player);
}
