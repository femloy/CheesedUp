username = "";

default_spr = sprite_index;
sprite = default_spr;
frame = 0;
xscale = 1;
yscale = 1;
palettetexture = noone;
paletteselect = 1;
spr_palette = spr_peppalette;

state_prev = states.normal;
state = states.normal;
lerp_time = 0;
lerp_time_max = 3;

packet_max = 5;
packets = [];

name_color = "#FFFFFF";

xprev = x;
yprev = y;

xx = x;
yy = y;

frames_per_second = 0;
packets_this_frame = 0;
alarm[0] = room_speed;

x_prev = x;
y_prev = y;