if global.panic && !check_lap_mode(LAP_MODES.infinite) && global.laps >= 1
{
	mask_index = wokespr;
	sprite_index = wokespr;
	x = xstart;
	y = ystart;
}
else
{
	x = -10000;
	y = -10000;
	sprite_index = sleepspr;
}
