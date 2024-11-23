if in_saveroom()
	instance_destroy();
if timeattack && global.can_timeattack
{
	instance_destroy(id, false);
	scr_destroy_tiles(32, "Tiles_1");
	scr_destroy_tiles(32, "Tiles_2");
	scr_destroy_tiles(32, "Tiles_3");
}
