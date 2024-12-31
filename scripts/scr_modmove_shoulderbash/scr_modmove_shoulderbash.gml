function scr_modmove_shoulderbash(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	if move_type != MOD_MOVE_TYPE.grabattack
	{
		if suplexmove2 or sprite_index == spr_attackdash or sprite_index == spr_airattackstart or sprite_index == spr_airattack
			exit;
	}
	
	fmod_event_instance_stop(suplexdashsnd, false);
	fmod_event_instance_play(snd_dive);
	
	image_index = 0;
	if grounded
	{
		with instance_create(x, y, obj_superdashcloud)
			copy_player_scale(other);
		sprite_index = spr_attackdash;
	}
	else
	{
		if move_type != MOD_MOVE_TYPE.grabattack
		{
			suplexmove2 = true;
			if vsp > -4
				vsp = -4;
		}
		sprite_index = spr_airattackstart;
	}
	
	suplexmove = true;
	state = states.handstandjump;
	movespeed = max(movespeed, 10);
	
	particle_set_scale(part.crazyrunothereffect, xscale, 1);
	create_particle(x, y, part.crazyrunothereffect);
}
