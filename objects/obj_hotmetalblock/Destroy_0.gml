if !in_saveroom()
{
	repeat (6)
	{
		with (instance_create(x + 32, y + 32, obj_metaldebris))
			sprite_index = spr_supermetalblock_debris;
	}
	shake_camera(20, 40 / room_speed);
	sound_play("event:/sfx/misc/breakmetal");
	add_saveroom();
}
depth = 1;
 