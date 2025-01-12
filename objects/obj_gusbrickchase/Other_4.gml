if global.panic or (obj_player1.character == "N" && !global.swapmode)
{
	instance_destroy();
	exit;
}

if !global.sandbox && gamesave_open_ini()
{
	if ini_read_real("w1stick", "door", false)
		instance_destroy();
	gamesave_close_ini(false);
}
else
	instance_destroy();
