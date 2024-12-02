function net_event_welcome(packet) 
{
    online 
	{
        admin = packet.admin;
		username = packet.username;
		
		instance_activate_object(obj_otherplayer);
		with obj_otherplayer
			instance_destroy();
		players = {};
		
		net_send_room_change();
    }
}
