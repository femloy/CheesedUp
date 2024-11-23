if !in_saveroom()
{
	//trace("adding to save room!");
	repeat (8 * max(abs(image_xscale), abs(image_yscale)))
	{
		with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_index = random_range(0, image_number - 1);
			image_speed = 0;
		}
	}
	
	var playerindex = instance_nearest(x, y, obj_player);
	if playerindex
		GamepadSetVibration(playerindex.object_index == obj_player2 ? 1 : 0, 1, 1, 0.8);
	
	shake_camera(20, 40 / room_speed);
	sound_play("event:/sfx/misc/breakmetal");
	add_saveroom();
}
scr_cutoff();
if is_string(targettiles)
	scr_destroy_tiles(32, targettiles);
else
	scr_destroy_tile_arr(32, targettiles);
scr_destroy_nearby_tiles();
depth = 1;