function scr_postgame()
{
	if global.sandbox
		return true;
	
	ini_open_from_string(obj_savesystem.ini_str);
	var r = ini_key_exists("Ranks", "exit");
	ini_close();
	return r;
}
