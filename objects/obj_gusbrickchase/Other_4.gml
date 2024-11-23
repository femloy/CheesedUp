if global.sandbox or global.panic
or (obj_player1.character == "N" && !global.swapmode)
{
	instance_destroy();
	exit;
}

ini_open_from_string(obj_savesystem.ini_str);
if ini_read_real("w1stick", "door", false)
	instance_destroy();
ini_close();
