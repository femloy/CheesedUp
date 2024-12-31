function scr_modmove_breakdance(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	fmod_event_instance_play(breakdancesnd);
	if !grounded
		vsp = -4;
	else
	{
		with instance_create(x, y, obj_dashcloud2)
			copy_player_scale(other);
	}
	movespeed = max(movespeed, 9);
	state = states.punch;
	sprite_index = spr_breakdancemove;
	breakdance = 35;
	image_index = 0;
}
