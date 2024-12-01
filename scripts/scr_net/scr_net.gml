#macro SERVER_ADDRESS "127.0.0.1"
#macro SERVER_PORT 5060
#macro CLIENT_PORT 5070

#macro net_debug true
#macro online if (instance_exists(obj_netclient) and os_is_network_connected() and obj_netclient.connection != noone) with (obj_netclient)

global.builtins = ["id", "room", "sprite_width", "sprite_height"];

function net_connect(address, sport)
{
	var port = CLIENT_PORT;
	
	var tcp_socket = -1, udp_socket = -1;
	do
	{
		if port <= 0 || port >= 65535
		{
			net_alert("WHAT THE FUCK");
			return noone;
		}
		
		if tcp_socket >= 0
			network_destroy(tcp_socket);
		tcp_socket = network_create_socket_ext(network_socket_tcp, port);
			
		if udp_socket >= 0
			network_destroy(udp_socket);
		udp_socket = network_create_socket_ext(network_socket_udp, port);
		
		port++;
	}
	until (tcp_socket >= 0 && udp_socket >= 0);
	
	if network_connect_raw(tcp_socket, address, sport) < 0
		return noone;
	
	return
	{
		tcp: tcp_socket,
		udp: udp_socket,
	};
}

function net_disconnect(connection)
{
	if connection == noone
		return noone;
	net_send_tcp("goodbye", {});
	if connection.tcp >= 0 network_destroy(connection.tcp);
	if connection.udp >= 0 network_destroy(connection.udp);
	return noone;
}
