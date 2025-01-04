enum tvprompt
{
	normal,
	trigger,
	transfo
}

image_speed = 0.1;
chose = false;
message = "";
showtext = false;
tvprompts_list = ds_list_create();
state = states.normal;
promptxstart = 641;
promptx = promptxstart;
prompt = "";
promptspd = 1;
prompt_buffer = 0;
prompt_max = 150;
//promptsurface = surface_create(290, 102);
promptsurface = -1;
visualcombo = 0;
tv_bg_index = 0;
tv_trans = 0;
tv_cooldown = 0;
targetgolf = noone;
special_prompts = noone;
hud_posx = 0;
hud_posY = 0;
combo_state = 0;
combo_posX = 0;
combo_vsp = 0;
combo_posY = 0;
combofill_x = 0;
combofill_y = 0;
combofill_index = 0;
noisemax = 6;
noisebuffer = noisemax;
expressionsprite = noone;
expressionbuffer = 0;
golfsurf = noone;
tvsprite = spr_tv_idle;
sprite_index = spr_tv_off;
bubbleindex = 0;
bubblespr = noone;
idleanim = 180;
noisesprite = spr_noiseHUD_idle;
xi = 500;
yi = 600;
imageindexstore = 0;
once = false;
global.hurtcounter = 0;
global.hurtmilestone = 3;
alpha = 1;
shownrankp = false;
shownranks = false;
shownranka = false;
shownrankb = false;
shownrankc = false;
collect_shake = 0;
global.srank = 0;
global.arank = 0;
global.brank = 0;
global.crank = 0;
character = "PEPPINO";
chunkmax = 0;
timer_xplus = -153;
timer_yplus = -76;
timer_xstart = (SCREEN_WIDTH / 2) + timer_xplus;
timer_ystart = SCREEN_HEIGHT + timer_yplus;
timer_x = timer_xstart;
timer_y = timer_ystart + 212;
timer_tower = false;
pizzaface_sprite = spr_timer_pizzaface1;
pizzaface_index = 0;
johnface_sprite = spr_timer_johnface;
johnface_index = 0;
hand_sprite = spr_timer_hand1;
hand_index = 0;
barfill_x = 0;
showtime_buffer = 0;
idlespr = spr_tv_idle;

// pto
tv_bg = {surf: noone, sprite: spr_gate_entranceBG, parallax: [0.65, 0.75, 0.85], x: 0, y: 0};
lapflag_index = 0;
targetspr = spr_tv_off;
targetspr_old = spr_tv_off;
propeller_index = 0;
hand_x = 0;
hand_y = 0;
fill_lerp = 0;
lap_x = timer_x;
lap_y = SCREEN_HEIGHT + 212;
sugary_level = false;
tvreset = 0;
jumpscare = -1;
//jumpscareimage = irandom(sprite_get_number(spr_scares) - 1);
jumpscaretext = 0
manualhide = false;

spr_empty = spr_tv_empty;
spr_whitenoise = spr_tv_whitenoise;
spr_bgfinal = spr_tv_bgfinal;
spr_clip = spr_tv_clip;
placeholderspr = spr_tv_empty;
