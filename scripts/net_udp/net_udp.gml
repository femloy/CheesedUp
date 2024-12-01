function net_udp(async_load) 
{
	if live_call(async_load) return live_result;
	
	online 
	{
		var buffer = async_load[?"buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);

		try 
		{
			var packet = net_intermediate_to_struct(buffer);
			if packet == noone 
				return;
			
			if net_debug
			{
				show_debug_message($"       | Packet #{packet.id}");
				net_log_buffer(buffer);	
			}
			
			net_event_string(packet.type, packet);
		} 
		catch (e) 
		{
			net_log(e);
		}
	}	
}

function net_send_udp(type, packet) 
{
	online 
	{
		var buffer = net_struct_to_intermediate(type, packet, 0);
		if network_send_udp_raw(connection.udp, SERVER_ADDRESS, SERVER_PORT, buffer.data, buffer_get_size(buffer.data)) < 0 
		{
			if net_debug
				net_log($"Failed to send UDP event.");
			buffer_delete(buffer.data);
			return;
		}
		buffer_delete(buffer.data);
	}
}