address = SERVER_ADDRESS;
port = SERVER_PORT;

paused = false;
connection = net_connect(address, port);
requests = ds_map_create();
players = {};
last_room = room;

delay_timer = 0;
online_delay = 1;
heart_rate = 1;
heart_delay = 4;
disconnected = false;

paletteselect = 1;
spr_palette = noone;

name_color = "#FFFFFF";
username = "Player";
account = 0;
admin = false;

instance_create_unique(0, 0, obj_netchat);

if connection == noone
	instance_destroy();

pending_room_change = false;