function net_tcp(async_load)
{
	online 
	{
		var buffer = async_load[?"buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);
		
		while (true) 
		{
			try 
			{
				var packet = net_intermediate_to_struct(buffer);
				if (packet == noone) return;
			
				if (net_debug) 
				{
					show_debug_message($"       | Packet #{packet.id}");
					net_log_buffer(buffer);
				}

				if packet.reply != 0 && ds_map_exists(requests, net_int_string(packet.reply)) 
				{
					requests[? net_int_string(packet.reply)](packet);
					ds_map_delete(requests, net_int_string(packet.reply))
				} 
				else net_event_string(packet.type, packet);
			} catch (e) 
			{
				if net_debug trace(e);
			}
			
			if buffer_tell(buffer) >= buffer_get_size(buffer) - 1
				break;
		}
	}
}

function net_send_tcp(type, packet) 
{
	online 
	{
		var inter = net_struct_to_intermediate(type, packet, 0);
		if network_send_raw(connection.tcp, inter.data, buffer_get_size(inter.data), {}) < 0 
		{
			if net_debug 
				net_log($"Failed to send TCP event.");
			buffer_delete(inter.data);
			return;
		}
		buffer_delete(inter.data);
	}
}

function net_request(type, packet, callback) 
{
	online 
	{
		var inter = net_struct_to_intermediate(type, packet, 0);
		requests[? net_int_string(inter.id)] = callback;
		if network_send_raw(connection.tcp, inter.data, buffer_get_size(inter.data), {}) < 0 
		{
			if net_debug 
				net_log($"Failed to send TCP request.");
			buffer_delete(inter.data);
			return;
		}
		buffer_delete(inter.data);
	}
}