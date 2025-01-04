function scr_modmove_crouchslide()
{
	particle_set_scale(part.jumpdust, xscale, 1);
	create_particle(x, y, part.jumpdust);
	
	machhitAnim = false;
	grav = 0.5;
	sprite_index = spr_crouchslip;
	
	if !IT_old_machroll()
	{
		movespeed = 12;
		crouchslipbuffer = 25;
		image_index = 0;
		state = states.tumble;
		fmod_event_instance_play(snd_crouchslide);
	}
	else
	{
		movespeed = 15;
		state = states.crouchslide;
			
		if IT_crouchslide_super()
			sprite_index = spr_breakdancesuper;
	}
}
