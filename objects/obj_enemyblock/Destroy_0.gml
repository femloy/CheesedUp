if !in_saveroom()
{
	repeat (7)
		create_debris(x + 32, y + 32, spr_bigdebris);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
