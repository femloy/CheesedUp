live_auto_call;

maxspeed = 8;
image_speed = 0.35;
depth = -5;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
savedx = x;
savedy = y;
x = obj_player1.x;
y = obj_player1.y;
alarm[1] = 10;
image_alpha = 0;
treasure = false;
snd = fmod_event_create_instance("event:/sfx/pizzaface/moving");
slow_snd = fmod_event_create_instance("event:/sfx/pizzahead/haywire");

tracker = noone;
frozen = false;

spr_idle = global.laps >= 2 ? spr_pizzaface_edit : spr_pizzaface;
if DEATH_MODE
{
	spr_docile = spr_pizzaface_docile;
	spr_toangry = spr_pizzaface_attackend;
	spr_todocile = spr_pizzaface_recovering;
}
spr_haywire = spr_pizzahead_haywire;

offsetx = 3;
offsety = 11;

if BO_NOISE
{
	if MIDWAY
		spr_idle = spr_pizzaface_bo;
}
if SUGARY_SPIRE
{
	if check_sugary()
		spr_idle = spr_coneball;
}

sprite_index = spr_idle;
mode = -1;

if DEATH_MODE && MOD.DeathMode
{
    sprite_index = spr_docile;
    destroyable = 0;
	
	mode = 0;
	end_turn = 0;
}
hsp = 0;
vsp = 0;
state = states.chase;
flash = false;

if REMIX
{
	depth = obj_drawcontroller.depth + 1;
	sprite_index = spr_pizzaface_spawn;
	image_speed = 0.3;
}
laugh_sound = false;
