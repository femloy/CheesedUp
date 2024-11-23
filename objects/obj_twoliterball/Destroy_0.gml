if BO_NOISE
{
	with (instance_create(x, y, obj_canonexplosion))
		rat = true;
	sound_play_3d("event:/modded/sfx/2literexplosion", x, y);
}
