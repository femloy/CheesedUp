if level != noone
{
	if gamesave_open_ini()
	{
		collect = ini_read_real("Treasure", level, false);
		gamesave_close_ini(false);
	}
}
