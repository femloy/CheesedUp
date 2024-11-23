if !in_saveroom()
{
	repeat 4
		create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_bombdebris);
	add_saveroom();
}
