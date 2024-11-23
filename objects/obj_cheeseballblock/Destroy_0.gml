if !in_saveroom()
{
	repeat (4)
		create_debris(x + 32, y + 32, spr_cheeseballblockdebris);
	add_saveroom();
}
