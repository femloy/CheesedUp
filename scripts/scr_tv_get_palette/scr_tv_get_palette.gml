function scr_tv_get_palette()
{
	var struct =
	{
		spr_palette: spr_tv_palette,
		paletteselect: global.tvcolor
	};
	
	if global.tvcolor == TV_COLORS.normal
	{
		struct.paletteselect = 1;
		if global.hud == HUD_STYLES.final
		{
			switch obj_player1.character
			{
				case "N": struct.paletteselect = 2; break;
				case "V": struct.paletteselect = 3; break;
				case "S": struct.paletteselect = 5; break;
				case "M": struct.paletteselect = 6; break;
				case "MS": struct.paletteselect = 7; break;
			}
		}
	}
	
	var custom = scr_modding_hook_any("tv/palette");
	if custom != undefined && is_struct(custom)
	{
		if custom[$ "spr_palette"] != undefined && sprite_exists(custom.spr_palette)
			struct.spr_palette = custom.spr_palette;
		if custom[$ "paletteselect"] != undefined
			struct.paletteselect = custom.paletteselect;
	}
	
	return struct;
}
