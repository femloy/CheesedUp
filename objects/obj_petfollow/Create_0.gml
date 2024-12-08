event_inherited();
image_speed = 0.35;

xoffset = 35;
yoffset = 0;
grav = 0.23;
state = states.normal;

var s = scr_pet_sprites(pet);
spr_run = s.spr_run;
spr_idle = s.spr_idle;
spr_panic = s.spr_panic;
spr_panicrun = s.spr_panicrun;
spr_taunt = s.spr_taunt;
spr_supertaunt = s.spr_supertaunt;

xprev = x;
yprev = y;
