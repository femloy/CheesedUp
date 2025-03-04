if other.key_up2 && other.character == character
{
	with other
	{
		with instance_create(x, y, obj_sausageman_dead)
		{
			sound_play_3d("event:/sfx/misc/clotheswitch", x, y);
			hsp = irandom_range(-5, 5);
			vsp = -irandom_range(6, 11);
			usepalette = true;
			sprite_index = spr_palettedresserdebris;
			if obj_player1.character == "N"
				sprite_index = spr_palettedresserdebrisN;
			spr_palette = obj_player1.spr_palette;
			paletteselect = other.paletteselect;
			oldpalettetexture = global.palettetexture;
		}
	}
	
	paletteselect++;
	if paletteselect >= array_length(palettes)
		paletteselect = 0;
	while palettes[paletteselect][1] == 0
	{
		paletteselect++;
		if paletteselect >= array_length(palettes)
			paletteselect = 0;
	}
	
	var arr = palettes[paletteselect];
	other.player_paletteselect[other.player_paletteindex] = arr[2];
	
	var pattern = noone;
	if array_length(arr) > 3
		pattern = arr[3];
	other.player_patterntexture[other.player_paletteindex] = pattern;
	
	trace(other.player_paletteselect, " pal");
	trace(other.player_patterntexture, " texture");
	
	if gamesave_open_ini()
	{
		ini_write_real("Game", "palette", other.player_paletteselect[0]);
		ini_write_real("Game", "palette_player2", other.player_paletteselect[1]);
		ini_write_string("Game", "palettetexture", scr_get_texture_name(other.player_patterntexture[0]));
		ini_write_string("Game", "palettetexture_player2", scr_get_texture_name(other.player_patterntexture[1]));
		gamesave_close_ini(true);
	}
	
	palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"));
	palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]));
}
