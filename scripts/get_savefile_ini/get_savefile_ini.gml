function get_savefile_ini()
{
	if global.in_cyop
		return $"custom{global.currentsavefile}/" + filename_name(global.cyop_path) + ".ini";
	if !global.sandbox
		return concat("saveData", global.currentsavefile, "S.ini");
	return concat("saveData", global.currentsavefile, ".ini");
}
