function scr_save_attempts()
{
	if global.levelattempts <= 0 or global.leveltosave == noone or !global.saveloaded
		exit;
	
	if gamesave_open_ini()
	{
		ini_write_real("Game", "retries", ini_read_real("Game", "retries", 0) + global.levelattempts);
		ini_write_real("Attempts", global.leveltosave, ini_read_real("Attempts", global.leveltosave, 0) + global.levelattempts);
		global.levelattempts = 0;
		gamesave_close_ini(true);
		gamesave_async_save();
	}
}
