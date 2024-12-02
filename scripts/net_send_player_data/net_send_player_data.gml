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
		
			state: obj_player1.state
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
