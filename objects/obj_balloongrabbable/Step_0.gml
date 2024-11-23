if (cooldown > 0)
{
	cooldown--;
	active = false;
}
else if (!active)
{
	active = true;
	create_particle(x, y, part.genericpoofeffect, 0);
}
visible = active;
