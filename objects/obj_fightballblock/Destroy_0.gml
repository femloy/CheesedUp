if (room == custom_lvl_room)
	tile_layer_delete_at(1, x, y);
if !in_saveroom()
{
	repeat (4)
		create_debris(x + 16, y, spr_debris);
	var lay_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(lay_id);
	var data = tilemap_get_at_pixel(map_id, x, y);
	data = tile_set_empty(data);
	tilemap_set_at_pixel(map_id, data, x, y);
	lay_id = layer_get_id("Tiles_2");
	map_id = layer_tilemap_get_id(lay_id);
	data = tilemap_get_at_pixel(map_id, x, y);
	data = tile_set_empty(data);
	tilemap_set_at_pixel(map_id, data, x, y);
	add_saveroom();
}
