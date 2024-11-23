pal_swap_init_system(shd_pal_swapper);
global.roommessage = "TOO HEAVY AND TOO FAT";

if obj_player1.character == "V"
{
	var lay_id = layer_get_id("Assets_1");
	var asset = layer_sprite_get_id(lay_id, "graphic_6E15A16A");
	layer_sprite_destroy(asset);
}
