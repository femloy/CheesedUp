function pal_swap_index_palette(_spr)
{
	if !ds_map_exists(global.Pal_Map, _spr)
	{
		var _colors = sprite_get_height(_spr);
		var _palettes = [];
		ds_map_add(global.Pal_Map, _spr, _palettes);
		
		if sprite_get_width(_spr) > 1
		{
			var _num = sprite_get_width(_spr);
			var _surface = surface_create(_num, _colors);
			surface_set_target(_surface);
			draw_sprite(_spr, 0, sprite_get_xoffset(_spr), sprite_get_yoffset(_spr));
		}
		
		for (var i = 0; i < _num; i++)
		{
			var _pal = [];
			for (var ii = 0; ii < _colors; ii++)
				array_push(_pal, surface_getpixel(_surface, i, ii));
			array_push(_palettes, _pal);
		}
		
		trace(_num, " palettes indexed for sprite: ", sprite_get_name(_spr));
		surface_reset_target();
		surface_free(_surface);
	}
	//else
	//	show_debug_message("That palette has already been indexed.");
}
