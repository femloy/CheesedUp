active = true;
waitbuffer = 0;

override_state = noone;
override_sprite = obj_player1.spr_hurt;
override_vars = {};

spr_open = spr_secretportal_spawnopen;
spr_idle = spr_secretportal_spawnidle;
spr_close = spr_secretportal_spawnclose;
snd_exit = "event:/sfx/misc/secretexit";

if DEATH_MODE
{
	death = object_index == obj_deathportalexit;
	if death
	{
		if !MOD.DeathMode
			instance_destroy();
		image_blend = #D8B8F8;
	}
}

if SUGARY_SPIRE
{
	sugary = !global.sugaryoverride or (DEATH_MODE && (death ? SUGARY : check_sugarychar()));
	if sugary
	{
		spr_open = spr_secretportal_spawnopen_ss;
		spr_idle = spr_secretportal_spawnidle_ss;
		spr_close = spr_secretportal_spawnclose_ss;
		snd_exit = "event:/nosound";
		sprite_index = spr_open;
	}
}

if BO_NOISE
{
	if MIDWAY
	{
		spr_open = spr_secretportal_spawnopen_bo;
		spr_idle = spr_secretportal_spawnidle_bo;
		spr_close = spr_secretportal_spawnclose_bo;
		sprite_index = spr_open;
	}
}

// If we aren't coming or going from a secret, we don't need to exist.
if ((DEATH_MODE && death) or (!room_is_secret(obj_player1.lastroom) && !room_is_secret(room) && !instance_exists(obj_ghostcollectibles))
or obj_player1.targetDoor != "S" or instance_exists(obj_backtohub_fadeout)) && !instance_exists(obj_cyop_loader)
{
	active = false;
	visible = false;
}
