var gerome = global.gerome && (global.lapmode == lapmodes.april or global.in_cyop);
if global.panic && escape && !gerome
{
	image_xscale *= -1;
	x -= image_xscale * 32;
}
