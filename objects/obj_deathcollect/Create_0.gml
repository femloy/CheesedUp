if DEATH_MODE
{
	image_speed = 0.35;
	if !MOD.DeathMode or (global.laps >= 2 && global.lapmode == LAP_MODES.laphell)
		instance_destroy(id, false);
	depth = 0;
}
else
	instance_destroy();
