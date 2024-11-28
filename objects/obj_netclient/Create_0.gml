connection = net_connect(ADDRESS, SERVER_PORT);
requests = ds_map_create();

if !object_exists(obj_chatshell)
	instance_create_depth(0, 0, 0, obj_chatshell);