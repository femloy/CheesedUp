if (respawn > 0)
	respawn--;
if (respawn == 0 && visible == 0)
{
	if REMIX
		create_particle(x, y, part.genericpoofeffect);
	visible = true;
	x = xstart;
	y = ystart;
}
