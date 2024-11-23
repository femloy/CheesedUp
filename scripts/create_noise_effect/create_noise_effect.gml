function create_noise_effect(x, y, xscale = false)
{
	var o = instance_create(x, y, obj_noiseeffect);
	with o
		copy_player_scale(other, !xscale);
	return o;
}
