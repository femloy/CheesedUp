function scr_modmove_faceplant(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	var swapdir = key_left + key_right;
	if swapdir != 0
		xscale = swapdir;
	
	movespeed = max(movespeed, grounded ? 7 : 9);
	if movespeed < 24
		movespeed += 1;
	if !grounded
		vsp = -5;
	
	image_index = 0;
	sprite_index = spr_faceplant;
	
	state = states.faceplant;
	image_speed = 0.5;
	
	if character == "N"
		sound_play_3d(sfx_spin, x, y);
	else if IT_final_sounds()
		sound_play_3d("event:/modded/sfx/faceplant", x, y);
	
	particle_set_scale(part.jumpdust, xscale, 1);
	create_particle(x, y, part.jumpdust);
	
	particle_set_scale(part.crazyrunothereffect, xscale, 1);
	create_particle(x, y, part.crazyrunothereffect);
}
