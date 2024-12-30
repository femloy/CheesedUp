function scr_modding_disabled_functions()
{
	return
	[
		"gml_func_add",
		"gml_func_remove",
		"live_function_add",
		"live_function_remove",
		
		"scr_load_bank",
		
		"game_end",
		"game_restart",
		"environment_get_variable",
		
		"http_request",
		"http_get",
		"http_get_file",
		"http_post_string",
		"http_get_request_crossorigin",
		"http_set_request_crossorigin",
		
		"network_create_server",
		"network_create_server_raw",
		"network_create_socket",
		"network_create_socket_ext",
		"network_connect",
		"network_connect_async",
		"network_connect_raw",
		"network_connect_raw_async",
		// "network_resolve",
		"network_set_config",
		"network_set_timeout",
		"network_send_broadcast",
		"network_send_packet",
		"network_send_raw",
		"network_send_udp",
		"network_send_udp_raw",
		"network_destroy",
		
		"file_delete",
		"file_rename",
		"file_copy",
		"directory_destroy",
	];
}
