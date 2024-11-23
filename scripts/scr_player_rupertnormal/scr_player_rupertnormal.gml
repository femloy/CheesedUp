function scr_player_rupertnormal()
{
	SS_CODE_START;
	
	doublejump = false;
	momemtum = false;
	
	move = (key_left + key_right);
	hsp = (xscale * movespeed);
	var a = xscale
	if (move != 0)
	{
		xscale = move;
		if a != xscale movespeed = 2
		if (movespeed < 8)
			movespeed += 0.25;
		else if (movespeed >= 8)
			movespeed -= 0.15;
	}
	else
		movespeed = Approach(movespeed, 0, 0.6);
	
	// Slide.
	if (grounded && scr_solid_slope(x, y))
	{		
		movespeed = 8;
		xscale = -slope_direction();
		with (instance_create(x, y, obj_jumpdust))
			copy_player_scale(other);
		state = states.rupertslide;
	}
	
	// Animation.
	if (move == 0)
		sprite_index = spr_player_skateidle;
	else
		sprite_index = spr_player_skateslowwalk;
	
	// Jump.
	if (key_jump && grounded)
	{
		jumpstop = false;
		image_index = 0;
		sprite_index = spr_player_skatejumpstart;
	    scr_fmod_soundeffect(jumpsnd, x, y);
	    instance_create(x, y, obj_highjumpcloud2);
	    vsp = -10;
		movespeed = hsp;
	    state = states.rupertjump;
	}
	
	// Fall
	if !grounded
	{
		sprite_index = spr_player_skatedive;
		movespeed = hsp;
		state = states.rupertjump;	
	}
	
	image_speed = 0.35;
	
	SS_CODE_END;
}