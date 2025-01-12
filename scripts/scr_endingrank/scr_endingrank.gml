function scr_get_endingrank(open_ini = true)
{
	if open_ini
	{
		if !gamesave_open_ini()
			return 0;
	}
	
	var _perc = get_percentage(), r = "yousuck";
	if _perc >= 95
		r = "wow";
	else if _perc >= 83
		r = "notbad";
	else if _perc >= 72
		r = "nojudgement";
	else if _perc >= 61
		r = "officer";
	else if _perc >= 50
		r = "confused";
	
	if ini_read_string("Game", "finalrank", "none") == "none"
	{
		if global.file_minutes < 240 && _perc >= 95
			r = "holyshit";
		else if global.file_minutes < 120
			r = "quick";
	}
	if ini_read_string("Game", "finalrank", "none") == "holyshit"
		r = "holyshit"; // never lose holy shit rank
	
	if open_ini
		gamesave_close_ini(false);
	return r;
}
function scr_save_endingrank()
{
	if gamesave_open_ini()
	{
		ini_write_string("Game", "finalrank", scr_get_endingrank(false));
		if !ini_read_real("Game", "snotty", false)
			ini_write_real("Game", "finalsnotty", true);
		gamesave_close_ini(true);
		gamesave_async_save();
	}
}
