cyop_freemusic();

var key = ds_map_find_first(music_map);
while !is_undefined(key)
{
	var this = music_map[? key];
	if this.event != noone
		destroy_sounds([this.event]);
	if this.event_secret != noone
		destroy_sounds([this.event_secret]);
	
	key = ds_map_find_next(music_map, key);
}
ds_map_destroy(music_map);
