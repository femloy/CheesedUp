pal_swap_init_system(shd_pal_swapper);
global.roommessage = "THUNDERSTRUCK";

if obj_player1.character != "V"
{
	var lay_id = layer_get_id("Assets_2");
	var asset = layer_sprite_get_id(lay_id, "graphic_19F386B5");
	layer_sprite_destroy(asset);
}
if REMIX
	layer_depth("Assets_1", 10);
