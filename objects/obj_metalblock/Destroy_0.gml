if !in_saveroom()
{
	if particlespr == spr_harddoughblockdead
	{
		with instance_create(x + sprite_width / 2, y + sprite_height / 2, obj_sausageman_dead)
			sprite_index = other.particlespr;
	}
	else
	{
		repeat (8)
		{
			with (create_debris(x + random_range(0, 64), y + random_range(0, 64), particlespr, false))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
				image_speed = 0;
				image_index = random_range(0, image_number - 1);
			}
		}
	}
	scr_sleep(5);
	instance_create(x + 32, y + 32, obj_bangeffect);
	shake_camera(20, 40 / room_speed);
	
	var playerindex = instance_nearest(x, y, obj_player);
	if playerindex
		GamepadSetVibration(playerindex.object_index == obj_player2 ? 1 : 0, 1, 1, 0.8);
	sound_play("event:/sfx/misc/breakmetal");
	
	if escape
		add_saveroom(global.escaperoom);
	else
		add_saveroom();
}
