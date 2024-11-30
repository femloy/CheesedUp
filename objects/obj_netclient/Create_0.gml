address = SERVER_ADDRESS;
port = SERVER_PORT;

reconnecting_text = "Reconnecting";
paused = false;
connection = net_connect(address, port);
requests = ds_map_create();
<<<<<<< Updated upstream
admin = false;
instance_create_unique(0, 0, obj_netchat);
=======

heart_rate = 1;
heart_delay = 4;
alarm[0] = floor(heart_rate * room_speed);

username = "Player";
admin = false;

instance_create_unique(0, 0, obj_netchat);
>>>>>>> Stashed changes
