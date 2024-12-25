if global.gerome && (global.lapmode == LAP_MODES.april or afom)
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
