function pal_swap_player_palette(sprite = sprite_index, image = image_index, xscale = image_xscale, yscale = image_yscale, player = obj_player1, force_peppino = false)
{
	shader_set(global.Pal_Shader);
	with obj_player1
	{
		var spr = spr_palette, pal = paletteselect, pattern = global.palettetexture;
		if force_peppino
		{
			var palinfo = get_pep_palette_info();
			spr = palinfo.spr_palette;
			pal = palinfo.paletteselect;
			pattern = palinfo.patterntexture;
		}
		else if custom_palette
			cuspal_set(custom_palette_array);
		
		pal_swap_supernoise(false);
		pattern_set(global.Base_Pattern_Color, sprite, image == -1 ? other.image_index : image, xscale, yscale, pattern);
		pal_swap_set(spr, pal);
	}
}
