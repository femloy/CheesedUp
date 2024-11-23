function scr_save_attempts()
{
	if global.levelattempts <= 0 or global.leveltosave == noone
		exit;
	
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("Game", "retries", ini_read_real("Game", "retries", 0) + global.levelattempts);
	ini_write_real("Attempts", global.leveltosave, ini_read_real("Attempts", global.leveltosave, 0) + global.levelattempts);
	global.levelattempts = 0;
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}
