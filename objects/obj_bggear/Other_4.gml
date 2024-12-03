SS_CODE_START;

var layers = layer_get_all();
for(var i = 0; i < array_length(layers); i++)
{
	var tile = layer_tilemap_get_id(layers[i]);
	if tile != -1
		depth = max(depth, layer_get_depth(layers[i]) + 1);
}

SS_CODE_END;
