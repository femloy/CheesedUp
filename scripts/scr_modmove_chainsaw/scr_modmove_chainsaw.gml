function scr_modmove_chainsaw(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	if global.fuel <= 0
		exit;
	
	fmod_event_instance_play(suplexdashsnd);
	
	var swapdir = key_left + key_right;
	if swapdir != 0
		xscale = swapdir;
	
	particle_set_scale(part.jumpdust, xscale, 1);
	create_particle(x, y, part.jumpdust, 0);
	
	particle_set_scale(part.crazyrunothereffect, xscale, 1);
	create_particle(x, y, part.crazyrunothereffect);
	
	with instance_create(x, y, obj_superdashcloud)
		copy_player_scale(other);
	
	global.fuel = floor(global.fuel - 1);
	state = states.chainsawbump;
	movespeed = max(movespeed, 10);
	sprite_index = spr_chainsawdash;
	image_index = 0;
	
	if global.hud == HUD_STYLES.old
	{
		with obj_tv
		{
			alarm[0] = 100;
			tvsprite = spr_tvchainsaw;
			image_index = 0;
			image_speed = 0.35;
		}
	}
}
