if !in_saveroom()
{
	with (instance_create(x + 32, y + 32, obj_sausageman_dead))
		sprite_index = spr_harddoughblockdead;
	scr_sleep(5);
	instance_create(x + 32, y + 32, obj_bangeffect);
	shake_camera(20, 40 / room_speed);
	GamepadSetVibration(playerindex, 1, 1, 0.8);
	sound_play_3d("event:/sfx/misc/breakmetal", x, y);
	add_saveroom();
}
depth = 1;
