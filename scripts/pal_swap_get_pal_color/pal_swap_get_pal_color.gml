function pal_swap_get_pal_color(sprite, pal_x, pal_y)
{
	if global.performance
		return c_white;
	
	var _palettes = ds_map_find_value(global.Pal_Map, sprite);
	if _palettes == undefined
	{
		trace($"[pal_swap_get_pal_color] sprite: {sprite} pal_x: {pal_x} pal_y: {pal_y} _palettes: {_palettes}");
		return c_white;
	}
	
	var _return = c_white;
	
	try
		_return = _palettes[pal_x][pal_y];
	catch (_palettes) {}
	
	return _return;
}
