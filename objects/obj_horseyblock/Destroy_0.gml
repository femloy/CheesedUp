if !in_saveroom()
{
	create_particle(x, y, part.genericpoofeffect);
	add_saveroom();
}
