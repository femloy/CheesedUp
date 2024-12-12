ptt {

function net_send_room_change()
{
	online
	{
		if room != room_empty && room != Mainmenu && room != characterselect 
		&& room != Mainmenu && room != Realtitlescreen && room != Initroom 
		&& room != Longintro && room != Creditsroom && room != Endingroom 
		&& room != rank_room && room != Finalintro && room != timesuproom
		&& room != Johnresurrectionroom && Scootertransition && instance_exists(obj_player1)
		{
			net_send_tcp("room_change",
            {
				room: room,
		
				x: obj_player1.x,
				y: obj_player1.y,
		
				sprite: player_sprite(obj_player1),
				xscale: image_xscale,

                cyop: instance_exists(obj_cyop_loader),
                hash: instance_exists(obj_cyop_loader) ? obj_cyop_loader.hash : "",
			});
		}
		else	
			pending_room_change = true;
	}
}

}
