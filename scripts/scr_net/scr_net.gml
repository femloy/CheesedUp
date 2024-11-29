#macro ADDRESS "127.0.0.1"
#macro SERVER_PORT 5060
#macro CLIENT_PORT 5070

#macro net_debug true
#macro online if instance_exists(obj_netclient) and os_is_network_connected() and obj_netclient.connection != noone with (obj_netclient)

function net_connect(address, sport) {
	var port = CLIENT_PORT;
	
	var tcp_socket = network_create_socket_ext(network_socket_tcp, port);
	var udp_socket = network_create_socket_ext(network_socket_udp, port);
	while tcp_socket < 0 || udp_socket < 0 {
		network_destroy(tcp_socket);
		network_destroy(udp_socket);
		port++;
		
		tcp_socket = network_create_socket_ext(network_socket_tcp, port);
		udp_socket = network_create_socket_ext(network_socket_udp, port);
	}

	if (network_connect_raw(tcp_socket, address, sport) < 0) {
		net_alert($"Failed to connect to {address}:{sport}.");
		return noone;
	}
	
	return {
		tcp: tcp_socket,
		udp: udp_socket,
	};
}

function net_disconnect(connection) {
	net_send_tcp("goodbye", {});
	network_destroy(connection.tcp);
	network_destroy(connection.udp);
}