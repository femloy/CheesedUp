function get_pep_palette_info()
{
	if global.swapmode
	{
		for(var i = 0; i < array_length(global.swap_characters); i++)
		{
			if global.swap_characters[i] == "P"
			{
				return
				{
					spr_palette: spr_peppalette,
					paletteselect: obj_player1.player_paletteselect[i],
					patterntexture: obj_player1.player_patterntexture[i]
				};
				break;
			}
		}
	}
	else if obj_player1.spr_palette == spr_peppalette
	{
		return
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return
	{
		spr_palette: spr_peppalette,
		paletteselect: 1,
		patterntexture: noone
	};
}
function get_noise_palette_info()
{
	if global.swapmode
	{
		for(var i = 0; i < array_length(global.swap_characters); i++)
		{
			if global.swap_characters[i] == "N"
			{
				return
				{
					spr_palette: spr_noisepalette,
					paletteselect: obj_player1.player_paletteselect[i],
					patterntexture: obj_player1.player_patterntexture[i]
				};
				break;
			}
		}
	}
	else if obj_player1.spr_palette == spr_noisepalette
	{
		return
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return
	{
		spr_palette: spr_noisepalette,
		paletteselect: 1,
		patterntexture: noone
	};
}