global.roommessage = "TUBULAR TRASH ZONE";
if global.panic
{
	var lay = layer_get_id("Backgrounds_1")
	layer_background_sprite(layer_background_get_id(lay), bg_sewer1escape)
	var lay2 = layer_get_id("Backgrounds_2")
	layer_background_sprite(layer_background_get_id(lay2), bg_sewer2escape)
}
