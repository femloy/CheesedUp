pal_swap_init_system(shd_pal_swapper);
global.roommessage = "THE KING PIZZA";

if obj_player1.character == "V"
{
	var lay_id = layer_get_id("Assets_1");
	var asset = layer_sprite_get_id(lay_id, "graphic_3A098791");
	layer_sprite_change(asset, spr_ratsdontlikedynamite);
}
