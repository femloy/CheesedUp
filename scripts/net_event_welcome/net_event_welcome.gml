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
		
		// instance activation quirk, try now?
		instance_activate_object(obj_otherplayer);
		with obj_otherplayer
			instance_destroy();
    }
}
