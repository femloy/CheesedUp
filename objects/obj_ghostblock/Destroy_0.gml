if !in_saveroom()
{
	repeat (8)
	{
		with (create_debris(x + random_range(0, 64), y + random_range(0, 64), spr_ghostblockdebris, false))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_speed = 0;
			image_index = random_range(0, image_number - 1);
		}
	}
	scr_sleep(5);
	instance_create(x + 32, y + 32, obj_bangeffect);
	shake_camera(20, 40 / room_speed);
	GamepadSetVibration(playerindex, 1, 1, 0.8);
	sound_play("event:/sfx/misc/breakmetal");
	add_saveroom();
}
