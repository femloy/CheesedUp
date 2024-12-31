function scr_modmove_grab(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	if suplexmove && IT_grab_suplexmove_check()
		exit;
	
	image_index = 0;
	if required_state == states.jump or required_state == states.jetpackjump
		sprite_index = spr_suplexdashjumpstart;
	else
		sprite_index = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;
	
	state = states.handstandjump;
	suplexmove = true;
	fmod_event_instance_play(suplexdashsnd);
	
	var suplexspeed = IT_suplexspeed(required_state);
	if !REMIX && (required_state == states.normal or required_state == states.jetpackjump)
		movespeed = suplexspeed;
	else
		movespeed = max(movespeed, suplexspeed);
	
	if !grounded
	{
		var v = IT_grab_vsp();
		if v != undefined
			vsp = v;
	}
	
	if IT_april_particles()
	{
		if grounded
		{
			with instance_create(x, y, obj_superdashcloud)
				copy_player_scale(other);
		}
		with instance_create(x, y, obj_crazyrunothereffect)
			copy_player_scale(other);
	}
		
	particle_set_scale(part.jumpdust, xscale, 1);
	create_particle(x, y, part.jumpdust, 0);
}