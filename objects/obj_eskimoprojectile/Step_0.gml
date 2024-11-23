SS_CODE_START;

x += image_xscale * 6;
if scr_solid(x + image_xscale, y)
{
	if bumpcount < 1
	{
	    image_xscale *= -1;
	    bumpcount += 1;
	}
	else
		instance_destroy();
}

SS_CODE_END;
