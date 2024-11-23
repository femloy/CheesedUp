if !in_saveroom()
{
	with (instance_create(x + 32, y + 32, obj_sausageman_dead))
		sprite_index = other.spr_dead;
	scr_sleep(5);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
