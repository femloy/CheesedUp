repeat (6)
{
	with (create_debris(x + random_range(-70, 70), y + random_range(55, -55), debris, true))
		image_speed = 0.35;
}
sound_play_3d(sfx, x, y);
