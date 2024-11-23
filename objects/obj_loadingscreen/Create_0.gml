group_arr = noone;
offload_arr = noone;
alarm[0] = 1;
depth = -601;
dark = false;
screenscale = 1;
pause = false;
pauseID = -4;

scr_create_pause_image();
fade = 0;

sound_list = ds_list_create();
instance_list = ds_list_create();
scr_pause_deactivate_objects(false);

cyop_changesave = false;
cyop_tower = "";
cyop_level = "";
