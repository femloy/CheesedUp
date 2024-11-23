if (room == custom_lvl_room)
	tile_layer_delete_at(1, x, y);
if !in_saveroom()
{
	for (var xx = bbox_left; xx < bbox_right; xx += 32)
	{
		for (var yy = bbox_top; yy < bbox_bottom; yy += 32)
		{
			with create_debris(xx + 16, yy + 16, spr_plugdebris)
				image_index = 0;
			with create_debris(xx + 16, yy + 16, spr_plugdebris)
				image_index = 1;
		}
	}
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
