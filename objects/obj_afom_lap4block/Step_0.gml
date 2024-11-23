if global.panic && !check_lap_mode(lapmodes.infinite) && global.laps >= 3
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
