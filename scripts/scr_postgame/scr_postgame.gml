function scr_postgame()
{
	if global.sandbox or !global.saveloaded
		return true;
	if gamesave_open_ini()
	{
		var r = ini_key_exists("Ranks", "exit");
		gamesave_close_ini(false);
		return r;
	}
	return false;
}
