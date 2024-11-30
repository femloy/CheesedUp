address = SERVER_ADDRESS;
port = SERVER_PORT;

paused = false;
connection = net_connect(address, port);
requests = ds_map_create();
last_room = room;

heart_rate = 1;
heart_delay = 4;
alarm[0] = floor(heart_rate * room_speed);
disconnected = false;

username = "Player";
admin = false;

instance_create_unique(0, 0, obj_netchat);

if connection == noone
	instance_destroy();
