if gamesave_open_ini()
{
	rank = ini_read_string("Ranks", string(levelsign), "none");
	gamesave_close_ini(false);
}
