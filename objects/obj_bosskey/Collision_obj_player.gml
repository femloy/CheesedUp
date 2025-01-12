if (state == states.normal)
{
	with (other)
	{
		sound_play("event:/sfx/misc/bosskey");
		state = states.gottreasure;
	}
	state = states.gottreasure;
	x = other.x;
	y = other.y - 50;
	if (!instance_exists(obj_bosscontroller))
		alarm[0] = 150;
	depth = -20;
	with (obj_bosscontroller)
	{
		state = states.victory;
		with (obj_hpeffect)
			spd = 16;
	}
	if gamesave_open_ini()
	{
		ini_write_real(save, "bosskey", true);
		gamesave_close_ini(true);
	}
}
