room_tiles = [];
room_bgs = [];
dynamic_layers = ds_map_create();
global.in_menu = false;
global.showcollisions = false;
global.time = 0;
multiplier = 0;
shell_force_off = false;
gif_record = false;
gif_image = noone;
good_timer = 0;
gotmessage = {message: "", author: "", time: -1};

depth = -9000;
was_birthday = false;

// globalvar is used so that I dont have to use "global." every time
globalvar SUGARY;
SUGARY = false;
globalvar MIDWAY;
MIDWAY = false;
