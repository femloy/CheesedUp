active = true;
trigger = 0;
touched = false;
playerid = noone;
secret = room_is_secret(room);
depth = 107;
soundtest = false;

spr_open = spr_secretportal_open;
spr_idle = spr_secretportal_idle;
spr_close = spr_secretportal_close;
snd_enter = "event:/sfx/misc/secretenter";

/*
use these with event triggers for sugary portals.

secret_close_portalID
secret_open_portalID
*/

if DEATH_MODE
{
	death = MOD.DeathMode;
	if death // placeholder
		image_blend = #D8B8F8;
}

if SUGARY_SPIRE
{
	sugary = (!global.sugaryoverride && SUGARY) or (global.sugaryoverride && check_sugarychar());
	if sugary
	{
		spr_open = spr_secretportal_open_ss;
		spr_idle = spr_secretportal_idle_ss;
		spr_close = spr_secretportal_close_ss;
		snd_enter = "event:/modded/sfx/secretenterSP";
		sprite_index = spr_idle;
		mask_index = spr_idle;
	}
	if SUGARY && secret
		depth = 10;
}

if BO_NOISE
{
	if MIDWAY
	{
		spr_open = spr_secretportal_open_bo;
		spr_idle = spr_secretportal_idle_bo;
		spr_close = spr_secretportal_close_bo;
		sprite_index = spr_idle;
		mask_index = spr_idle;
	}
}
ID = id;
