function sh_unlock_toppins(args)
{
	if !WC_debug
		return WC_NODEBUG;
	if global.sandbox or !global.saveloaded
		return "Unavailable in this mode"
	if array_length(args) < 2
		return "Missing level_name_ini argument";
	
	var level_name_ini = args[1];
	if !array_contains(base_game_levels(false), level_name_ini)
		return "Must be a base game level";
	
	if gamesave_open_ini()
	{
		ini_write_real("Toppin", concat(level_name_ini, 1), true);
		ini_write_real("Toppin", concat(level_name_ini, 2), true);
		ini_write_real("Toppin", concat(level_name_ini, 3), true);
		ini_write_real("Toppin", concat(level_name_ini, 4), true);
		ini_write_real("Toppin", concat(level_name_ini, 5), true);
		gamesave_close_ini(true);
		gamesave_async_save();
	}
}
function meta_unlock_toppins()
{
	return {
		description: "base game command - Unlocks the toppins of the given level",
		arguments: ["level_name_ini"]
	}
}
