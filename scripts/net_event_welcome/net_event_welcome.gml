function net_event_welcome(packet) 
{
	trace("balls1");
    online 
	{
        admin = packet.admin;
		username = packet.username;

		ds_map_clear(players);
		instance_activate_object(obj_otherplayer);
		with obj_otherplayer
			instance_destroy();
			
		net_send_tcp("room_change", {
			previous: last_room,
			current: room,
		});
    }
}