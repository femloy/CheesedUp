depth = -100;
minutes = 0;
seconds = 0;
addseconds = 0;
alarm[0] = 60;
warbg_init();
timer_y = SCREEN_HEIGHT + sprite_get_height(spr_wartimer);
timer_index = 0;
lapflag_index = 0;
lap_y = SCREEN_HEIGHT;

lap4rooms = ds_list_create();
