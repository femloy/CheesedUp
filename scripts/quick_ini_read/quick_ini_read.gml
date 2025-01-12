function quick_ini_read_real(ini_str, section, key, def)
{
	if gamesave_open_ini()
	{
		var b = ini_read_real(section, key, def);
		gamesave_close_ini(false);
		return b;
	}
	return def;
}
function quick_ini_read_string(ini_str, section, key, def)
{
	if gamesave_open_ini()
	{
		var b = ini_read_string(section, key, def);
		gamesave_close_ini(false);
		return b;
	}
	return def;
}
