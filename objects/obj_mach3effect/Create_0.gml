playerid = obj_player1;
image_speed = 0;
image_blend = global.mach_colors[irandom(array_length(global.mach_colors) - 1)];
alarm[1] = 3;
alarm[0] = 15;
image_alpha = playerid.movespeed / 12;
