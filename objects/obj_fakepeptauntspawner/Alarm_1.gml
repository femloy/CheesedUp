with (obj_fakepepprojectile)
{
	if (spawnerID == other.id)
	{
		create_particle(x, y, part.genericpoofeffect);
		instance_destroy();
	}
}
instance_destroy();
