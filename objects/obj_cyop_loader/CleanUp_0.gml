cyop_cleanup();
ds_map_destroy(global.cyop_audio);
ds_map_destroy(global.cyop_sprites);
ds_map_destroy(global.cyop_tiles);
ds_map_destroy(global.cyop_room_map);
ds_map_destroy(global.cyop_asset_cache);
ds_list_destroy(global.cyop_broken_tiles);
