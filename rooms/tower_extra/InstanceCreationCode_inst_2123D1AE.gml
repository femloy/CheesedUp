if !global.sandbox
{
	var lay = layer_get_id("Tiles_shopwall");
	layer_destroy(lay);
	instance_destroy();
}
