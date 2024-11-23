pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
global.leveltorestart = room;
gameframe_caption_text = lang_get_value("caption_boss_pizzaface");
global.level_minutes = 0;
global.level_seconds = 0;

with obj_player
{
	backtohubroom = tower_outside;
	backtohubstartx = 522;
	backtohubstarty = 2328;
}

if obj_player1.character == "N" or global.swapmode
{
	var bg = layer_background_get_id("Backgrounds_Ring2");
	layer_background_sprite(bg, bg_pizzaface1_3N);
}
