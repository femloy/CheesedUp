pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
gameframe_caption_text = lang_get_value("caption_boss_vigilante");

if check_char("V")
{
	gameframe_caption_text = lstr("caption_boss_snotty");
	
	var bg1 = layer_background_get_id("Backgrounds_2");
	layer_background_sprite(bg1, bg_snottyboss);
	
	var bg2 = layer_background_get_id("Backgrounds_scroll1");
	layer_background_sprite(bg2, bg_snottybg_pre);
	layer_hspeed("Backgrounds_scroll1", 0);
	
	var bg3 = layer_background_get_id("Backgrounds_Ring");
	layer_background_sprite(bg3, bg_snottyarena);
	
	layer_set_visible("Backgrounds_3", true);
}
