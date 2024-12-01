if instance_exists(obj_player1) && obj_player1.state != states.titlescreen
{
	net_send_udp("player_data", 
	{
		x: obj_player1.x,
		y: obj_player1.y,
		
		sprite: player_sprite(obj_player1),
		frame: obj_player1.image_index,
		xscale: obj_player1.xscale,
		
		state: obj_player1.state,
	});
}

alarm[2] = online_delay;