var total = global.pigtotal - global.pigreduction;
if (other.key_up2 && total >= maxscore && !unlocked)
{
	unlocked = true;
	if gamesave_open_ini()
	{
		ini_write_real(save, "unlocked", true);
		ini_write_real(save, "reduction", maxscore);
		gamesave_close_ini(true);
	}
	global.pigreduction += maxscore;
	state = states.transition;
	gamesave_async_save();
}
