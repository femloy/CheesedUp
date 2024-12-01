function net_event_welcome(packet) 
{
    online 
	{
        admin = packet.admin;
		username = packet.username;
		
		net_send_tcp("room_change", {
			previous: last_room,
			current: room,
		});
		
		ds_map_clear(players);
		instance_destroy(obj_otherplayer);
    }
}
