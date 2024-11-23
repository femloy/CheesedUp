live_auto_call;

// animation / background
sound_play("event:/modded/sfx/diagopen");

anim_con = 0;
anim_t = 0;
outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
jumpcurve = animcurve_get_channel(curve_jump, "curve1");

bg_pos = 0;
bg_image = random(3);
mixingfade = 0;
submenu = 0;

pizza = choose(spr_pizzacollect1_old, spr_pizzacollect2_old);
if irandom(100) == 1
	pizza = spr_pizzacollect3_old;
pizza_surf = -1;
curve = 0;
curve_prev = 0;

image_speed = 0.35;
depth = -450;
if obj_pause.pause
	depth = obj_pause.depth - 50;

// control
init = true;
postdraw = -1;
draw = -1;
select = -1;
move_hor = 0;
move_ver = 0;
arrowbufferH = -1;
arrowbufferV = -1;
mixing = false;

scr_init_input();
stickpressed_vertical = true;
open_menu();

event_user(1); // Build pizza vertex array

// functions
select = function()
{
	
}
postdraw = function(curve)
{
	
}
draw = function(curve)
{
	
}
