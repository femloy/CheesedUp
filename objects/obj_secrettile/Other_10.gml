// loop through every tile layer and add it to an array to draw it later
array_foreach(room_get_tile_layers(), function(i)
{
	if string_starts_with(i.layer_name, "Tiles_Secret")
	{
		var wd = tilemap_get_tile_width(i.tilemap);
		var ht = tilemap_get_tile_height(i.tilemap);
		
		for (var yy = bbox_top; yy < bbox_bottom; yy += ht)
		{
			for (var xx = bbox_left; xx < bbox_right; xx += wd)
			{
				var data = tilemap_get_at_pixel(i.tilemap, xx, yy);
				if data != -1
				{
					array_push(tiles, { x: xx, y: yy, tile_data: data, tileset: i.tileset });
					tilemap_set_at_pixel(i.tilemap, tile_set_empty(data), xx, yy);
				}
			}
		}
	}
});

// no need to exist
if array_length(tiles) == 0
{
	trace("obj_secrettile at ", room_get_name(room), " without any tiles");
	instance_destroy();
	exit;
}
