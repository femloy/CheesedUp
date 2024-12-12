ptt {

function net_send_player_data()
{
	if instance_exists(obj_player1) && obj_player1.state != states.titlescreen
	{
		net_send_udp("player_data", 
		{
			paused: false,
			
			x: obj_player1.x,
			y: obj_player1.y,
			
			sprite: player_sprite(obj_player1),
			frame: obj_player1.image_index,
			xscale: obj_player1.xscale,
			yscale: obj_player1.yscale,
		
			state: obj_player1.state,
			character: obj_player1.character,

            paletteselect: obj_player1.paletteselect,
            palettetexture: global.palettetexture,
            spr_palette: obj_player1.spr_palette,
		});
	}
	else
	{
		net_send_udp("player_data",
		{
			paused: true
		});
	}
}

}
