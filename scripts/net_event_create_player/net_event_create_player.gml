function net_event_create_player(packet)
{
	//trace("Create: ", packet);
	online
	{
		var old_player = players[$ packet.uuid];
		if old_player != undefined
			instance_destroy(old_player);
		
		net_log("Creating client '" + packet.uuid + "'");
		
		var p = instance_create(packet.x, packet.y, obj_otherplayer);
		players[$ packet.uuid] = p;
		net_copy(packet, p);
	}
}
