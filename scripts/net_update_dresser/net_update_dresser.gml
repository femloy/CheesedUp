function net_update_dresser()
{
	online net_send_tcp("player_data", 
	{
		paletteselect: paletteselect,
		palettetexture: global.palettetexture,
		spr_palette: spr_palette,
	});
}