if (room == custom_lvl_room)
	tile_layer_delete_at(1, x, y);
if !in_saveroom()
{
	repeat 4
		instance_create(x + 16, y + 16, obj_debris);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
