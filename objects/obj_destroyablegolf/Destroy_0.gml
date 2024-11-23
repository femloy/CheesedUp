if (room == custom_lvl_room)
	tile_layer_delete_at(1, x, y);
if !in_saveroom()
{
	with (instance_create(x + 16, y + 16, obj_sausageman_dead))
		sprite_index = spr_doughblockdead;
	scr_sleep(5);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
