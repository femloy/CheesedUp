pal_swap_init_system(shd_pal_swapper);
global.roommessage = "TREASURE ROOM";

if obj_player1.character == "V"
{
	var lay_id = layer_get_id("Assets_1");
	var asset = layer_sprite_get_id(lay_id, "graphic_215B03E0");
	layer_sprite_destroy(asset);
	
	layer_depth("Assets_1", 10);
}
