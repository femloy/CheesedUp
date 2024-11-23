global.roommessage = "FIVE NIGHTS AT THE PIZZA TOWER";
global.pepanimatronic = true;
gameframe_caption_text = lang_get_value("caption_kidsparty");
if global.panic
{
	var lay = layer_get_id("Backgrounds_still1");
	layer_background_sprite(layer_background_get_id(lay), bg_kidsparty_empty)
}
