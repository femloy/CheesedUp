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
	
	var _current_pal = ds_list_find_value(_palettes, pal_x);
	if _current_pal == undefined
	{
		trace($"[pal_swap_get_pal_color] sprite: {sprite} pal_x: {pal_x} pal_y: {pal_y} _palettes: {_palettes} _current_pal: {_current_pal}");
		return c_white;
	}
	
	var _return = ds_list_find_value(_current_pal, pal_y);
	if _return == undefined
	{
		trace($"[pal_swap_get_pal_color] sprite: {sprite} pal_x: {pal_x} pal_y: {pal_y} _palettes: {_palettes} _current_pal: {_current_pal} _return: {_return}");
		return c_white;
	}
	return _return;
}
