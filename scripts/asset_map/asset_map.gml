globalvar SPRITES;

SPRITES = ds_map_create();
for(var i = 0; sprite_exists(i); i++)
	ds_map_set(SPRITES, sprite_get_name(i), i);

globalvar OBJECTS;

OBJECTS = ds_map_create();
for(var i = 0; object_exists(i); i++)
	ds_map_set(OBJECTS, object_get_name(i), i);
