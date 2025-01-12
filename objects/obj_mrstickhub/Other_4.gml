if gamesave_open_ini()
{
	unlocked = ini_read_real(save, "unlocked", false);
	with obj_bossdoor
	{
		if save == other.save && !other.unlocked
		{
			other.bossdoorID = id;
			instance_deactivate_object(id);
		}
	}
	gamesave_close_ini(false);
}
if unlocked
	instance_destroy();
