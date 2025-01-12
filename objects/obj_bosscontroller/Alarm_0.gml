with obj_bosskeyspawn
{
	var _spawn = false;
	if !global.sandbox && gamesave_open_ini()
	{
		_spawn = !ini_read_real(save, "bosskey", false);
		gamesave_close_ini(false);
	}
	
	if _spawn
	{
		with obj_player1
		{
			if state == states.arenaintro
			{
				state = states.normal;
				isgustavo = false;
			}
		}
		with instance_create(x, -100, obj_bosskey)
		{
			save = other.save;
			y_to = other.y;
		}
	}
	else
	{
		with other
		{
			state = states.victory;
			with obj_hpeffect
				spd = 16;
		}
	}
}
