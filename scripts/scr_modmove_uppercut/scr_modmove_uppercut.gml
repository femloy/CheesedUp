function scr_modmove_uppercut(required_state = state)
{
	state = states.punch;
	image_index = 0;
	sprite_index = spr_breakdanceuppercut;
	fmod_event_instance_play(snd_uppercut);
	
	if character == "V"
		vsp = -(19 - vigi_uppercut_nerf * 4);
	else if character == "N"
		vsp = required_state == states.normal ? -20 : -21;
	else
		vsp = required_state == states.normal ? -14 : -10;
	
	movespeed = hsp;
	
	if global.banquet && key_attack && grounded
	&& (required_state == states.normal or required_state == states.jump)
	{
		// high jump going left maintains your speed
		// this is because the code for starting a mach run checks your movespeed
		// and that's in these two states
		movespeed = abs(hsp);
	}
	
	particle_set_scale(part.highjumpcloud2, xscale, 1);
	create_particle(x, y, part.highjumpcloud2, 0);
	
	if character == "N"
	{
		repeat 4
		{
			with instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect)
			{
				sprite_index = spr_shineeffect;
				image_speed = 0.35;
			}
		}
	}
	
	// vigi_uppercut_vsp
}
