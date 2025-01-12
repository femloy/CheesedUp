if gamesave_open_ini()
{
	var save = "w3stick";
	if ini_read_real(save, "bosskey", false) == 0 || ini_read_real(save, "noisekey", false)
		instance_destroy();
	gamesave_close_ini(false);
}
else
	instance_destroy();
