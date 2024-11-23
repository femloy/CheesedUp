x += (image_xscale * spd);
if (image_index > 7 && woosh)
{
	spd = 8;
	
	particle_set_scale(part.jumpdust, image_xscale, 1);
	create_particle(x, 401, part.jumpdust);
	
	woosh = false;
}
