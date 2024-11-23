if (destroy)
{
	repeat (6)
	{
		with (create_debris(x + random_range(-55, 55), y + random_range(70, -70), spr_cowmeat, true))
			image_speed = 0.35;
	}
	shake_camera(3, 3 / room_speed);
}
