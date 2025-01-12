event_inherited();
if gamesave_open_ini()
{
	if ini_read_real("Game", "snotty", false)
	{
		add_baddieroom();
		instance_destroy();
		if global.panic
			instance_create(x, y, obj_snotty);
	}
	gamesave_close_ini(false);
}
