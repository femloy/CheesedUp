function sh_unlock_toppins(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if global.sandbox
		return "Unavailable in this mode"
	if array_length(args) < 2
		return "Missing level_name_ini argument";
	
	var level_name_ini = args[1];
	if !array_contains(base_game_levels(false), level_name_ini)
		return "Must be a base game level";
	
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("Toppin", concat(level_name_ini, 1), true);
	ini_write_real("Toppin", concat(level_name_ini, 2), true);
	ini_write_real("Toppin", concat(level_name_ini, 3), true);
	ini_write_real("Toppin", concat(level_name_ini, 4), true);
	ini_write_real("Toppin", concat(level_name_ini, 5), true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}
function meta_unlock_toppins()
{
	return {
		description: "base game command - Unlocks the toppins of the given level",
		arguments: ["level_name_ini"]
	}
}
