/// @description get room layers
var layers = layer_get_all();
for (var i = 0, n = array_length(layers); i < n; i++)
{
	// tile layers
	var tilemap = layer_tilemap_get_id(layers[i]);
	if tilemap != -1
	{
		array_push(room_tiles, {
			layer_id: layers[i],
			layer_name: layer_get_name(layers[i]),
			tilemap: tilemap,
			tileset: tilemap_get_tileset(tilemap)
		});
		continue;
	}
	
	// backgrounds
	var bg = layer_background_get_id(layers[i]);
	if bg != -1
	{
		array_push(room_bgs, {
			layer_id: layers[i],
			layer_name: layer_get_name(layers[i]),
			x: layer_get_x(layers[i]),
			y: layer_get_y(layers[i]),
			bg_id: bg,
			bg_sprite: layer_background_get_sprite(bg)
		});
		continue;
	}
}

// sort in depth order
array_sort(room_tiles, function(a, b) {
	return layer_get_depth(b.layer_id) - layer_get_depth(a.layer_id);
});
array_sort(room_bgs, function(a, b) {
	return layer_get_depth(b.layer_id) - layer_get_depth(a.layer_id);
});
