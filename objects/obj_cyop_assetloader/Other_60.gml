var spr = async_load[? "id"];
sprite_set_speed(spr, 1, spritespeed_framespergameframe);

var pos = ds_list_find_index(to_load, spr);
ds_list_delete(to_load, pos);

trace($"Done sprite: {spr} Pos: {pos}");
