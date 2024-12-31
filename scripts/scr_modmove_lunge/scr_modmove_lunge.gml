function scr_modmove_lunge(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	if suplexmove
		exit;
	
	if grounded
	{
		with instance_create(x, y, obj_superdashcloud)
			copy_player_scale(other);
	}
	sprite_index = spr_lunge;
	suplexmove = true;
	
	particle_set_scale(part.jumpdust, xscale, 1);
	create_particle(x, y, part.jumpdust, 0);
	particle_set_scale(part.crazyrunothereffect, xscale, 1);
	create_particle(x, y, part.crazyrunothereffect);
	
	fmod_event_instance_play(suplexdashsnd);
	state = states.handstandjump;
	movespeed = max(movespeed, 10);
	vsp = 0;
	image_index = 0;
}
