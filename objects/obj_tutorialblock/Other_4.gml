if gamesave_open_ini()
{
	if !global.swapmode && !global.sandbox
	{
		var _destroyed = ini_read_real("Tutorial", "finished", false);
		if _destroyed
		{
			_destroyed = ini_read_real("Tutorial", "tutorialcutscene", false);
			if !_destroyed
			{
				ini_write_real("Tutorial", "tutorialcutscene", true);
				with obj_player
				{
					if place_meeting(x, y, obj_startgate)
					{
						with obj_tutorialblock
							alarm[0] = 100;
					}
				}
			}
			if alarm[0] == -1
				instance_destroy();
		}
		gamesave_close_ini(false);
	}
	else
	{
		ini_write_real("Tutorial", "finished", true);
		ini_write_real("Tutorial", "lapunlocked", true);
		instance_destroy();
		gamesave_close_ini(true);
	}
}
else
	instance_destroy();
