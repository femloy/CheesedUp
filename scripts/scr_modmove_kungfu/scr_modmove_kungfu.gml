function scr_modmove_kungfu(move_type = MOD_MOVE_TYPE.grabattack, required_state = state)
{
	if grounded
	{
		with instance_create(x, y, obj_superdashcloud)
			copy_player_scale(other);
		sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3);
	}
	else
		sprite_index = choose(spr_kungfuair1transition, spr_kungfuair2transition, spr_kungfuair3transition);
	suplexmove = true;
							
	particle_set_scale(part.crazyrunothereffect, xscale, 1);
	create_particle(x, y, part.crazyrunothereffect);
					
	sound_play_3d("event:/modded/sfx/kungfu", x, y);
	state = states.punch;
	movespeed = max(movespeed, 10);
	if vsp > 0
		vsp = 0;
	image_index = 0;
}
