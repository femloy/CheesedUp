if !in_saveroom()
{
	repeat 7
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
}
