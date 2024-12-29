if !in_saveroom()
{
	for (var xx = bbox_left; xx < bbox_right; xx += 32)
	{
		for (var yy = bbox_top; yy < bbox_bottom; yy += 32)
		{
			var spawn_x = REMIX ? xx : x, spawn_y = REMIX ? yy : y;
			with create_debris(spawn_x + 16, spawn_y + 16, spr_plugdebris)
				image_index = 0;
			with create_debris(spawn_x + 16, spawn_y + 16, spr_plugdebris)
				image_index = 1;
		}
	}
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
