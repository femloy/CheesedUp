SS_CODE_START;

hsp = image_xscale * movespeed;
x += hsp;

if timer > 0
    timer--;
else
    instance_destroy();

if scr_solid(x + hsp, y) || place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_metalblock)
    instance_destroy();

SS_CODE_END;
