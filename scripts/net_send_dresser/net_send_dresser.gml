function net_send_dresser() 
{
	with obj_player1
	{
		net_send_tcp("dresser",
		{
			palettetexture: global.palettetexture,
			paletteselect: paletteselect,
			spr_palette: spr_palette,
		});
	}
}