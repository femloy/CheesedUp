function net_udp(async_load) {
	online {
		var buffer = async_load[?"buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);

		try {
			var packet = net_intermediate_to_struct(buffer);
			if (packet == noone) return;
			
			if (net_debug) {
				show_debug_message($"       | Packet #{packet.id}");
				net_log_buffer(buffer);	
			}

			if packet.reply == 0
				net_event_string(packet.type, packet);
			else if ds_map_exists(requests, net_int_string(packet.reply)) {
				requests[? net_int_string(packet.reply)](packet);
				ds_map_delete(requests, net_int_string(packet.reply))
			}
		} catch (e) {
			net_log(e);
		}
	}	
}

function net_send_udp(type, packet) {
	online {
		var buffer = net_struct_to_intermediate(type, packet, 0);
		if network_send_udp_raw(connection.udp, ADDRESS, SERVER_PORT, buffer, buffer_get_size(buffer)) < 0 {
			net_alert($"Failed to send UDP event.");
			buffer_delete(buffer);
			return;
		}
		buffer_delete(buffer);
	}
}