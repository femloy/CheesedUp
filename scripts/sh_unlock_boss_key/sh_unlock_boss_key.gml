function sh_unlock_boss_key(args)
{
	if !WC_debug
		return WC_NODEBUG;
	if global.sandbox or !global.saveloaded
		return "Unavailable in this mode";
	if array_length(args) < 2
		return "Missing number argument";
	
	var number = args[1];
	if number != "1" && number != "2" && number != "3" && number != "4"
		return "Invalid world. Must be 1, 2, 3 or 4";
	
	if gamesave_open_ini()
	{
		var n = concat("w", number, "stick");
		ini_write_real(n, "bosskey", true);
		gamesave_close_ini(true);
		gamesave_async_save();
	}
}
function meta_unlock_boss_key()
{
	return {
		description: "base game command - Unlocks the boss key of the given world",
		arguments: ["number"],
		suggestions: [["1", "2", "3", "4"]]
	}
}
