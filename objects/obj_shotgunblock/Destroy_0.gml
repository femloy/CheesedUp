scr_destroy_tiles(32, "Tiles_1");
if !in_saveroom()
{
	notification_push(notifs.block_break, [room]);
	
	if sprite_index == spr_targetblock_old
	{
		repeat 7
			create_debris(x + 32, y + 32, spr_bigdebris);
	}
	else
	{
		with (create_debris(x + 32, y + 32, spr_shotgunblockdebris))
			image_index = 0;
		with (create_debris(x + 32, y + 32, spr_shotgunblockdebris))
			image_index = 1;
		with (create_debris(x + 32, y + 32, spr_shotgunblockdebris))
			image_index = 2;
	}
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
