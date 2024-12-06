function net_update_dresser()
{
	online net_send_tcp("dresser", 
	{
		paletteselect: paletteselect,
		palettetexture: global.palettetexture,
		spr_palette: spr_palette,
	});
}