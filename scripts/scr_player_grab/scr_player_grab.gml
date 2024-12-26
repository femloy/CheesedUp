function scr_player_grab()
{
	var april_swing = (IT_april_swing() && sprite_index == spr_swingding);
	var maxmovespeed = IT_walkspeed(); // 8
	var maxmovespeed2 = 6;
	var heavymovespeed = IT_heavywalkspeed(); // 2
	var accel = 0.5;
	var deccel = 0.1;
	
	grav = 0.5;
	move = key_left + key_right;
	if (grounded)
	{
		if (dir != xscale && !april_swing)
		{
			dir = xscale;
			movespeed = 2;
			facehurt = false;
		}
		jumpstop = false;
		anger = 100;
		if (!place_meeting(x, y + 1, obj_railparent))
		{
			if (sprite_index != spr_swingding)
				hsp = move * movespeed;
			else
				hsp = xscale * movespeed;
		}
		else
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
		}
		if (heavy == 0)
		{
			if (sprite_index != spr_swingding)
			{
				if (move != 0)
				{
					if (movespeed < maxmovespeed)
						movespeed += accel;
					else if (floor(movespeed) == maxmovespeed)
						movespeed = maxmovespeed2;
				}
				else
					movespeed = 0;
				if (movespeed > maxmovespeed2)
					movespeed -= deccel;
			}
		}
		else
		{
			if (move != 0)
			{
				if (movespeed < heavymovespeed)
					movespeed += 0.25;
				else if (floor(movespeed) == heavymovespeed)
					movespeed = heavymovespeed;
			}
			else
				movespeed = 0;
			if (movespeed > 2)
				movespeed -= 1;
		}
		if (move != 0 && sprite_index != spr_swingding)
			xscale = move;
		if (move != 0)
		{
			if (sprite_index != spr_swingding)
			{
				if (movespeed < 3 && move != 0)
					image_speed = 0.35;
				else if (movespeed > 3 && movespeed < 6)
					image_speed = 0.45;
				else
					image_speed = 0.6;
			}
			else if (heavy == 1)
				image_speed = 0.1;
			else
				image_speed = 0.35;
		}
	}
	if (sprite_index != spr_swingding)
	{
		if (!grounded)
		{
			if (dir != xscale)
			{
				dir = xscale;
				movespeed = 2;
				facehurt = false;
			}
			if (move != 0 && move != xscale)
				movespeed = 2;
			if (momemtum == 0)
				hsp = move * movespeed;
			else
				hsp = xscale * movespeed;
			if (move != 0 && move != xscale && momemtum == 1 && movespeed != 0)
				movespeed -= 0.05;
			if (movespeed == 0)
				momemtum = false;
			if (move != 0 && movespeed < 6)
				movespeed += 0.5;
			if (movespeed > 6)
				movespeed -= 0.5;
			if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
				movespeed = 0;
		}
		if (dir != xscale)
		{
			dir = xscale;
			movespeed = 2;
			facehurt = false;
		}
		if (move == -xscale)
		{
			mach2 = 0;
			momemtum = false;
		}
		landAnim = true;
		if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
		{
			vsp /= 20;
			jumpstop = true;
		}
		if (ladderbuffer > 0)
			ladderbuffer--;
		if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
		{
			vsp = grav;
			jumpstop = true;
		}
		if (move != 0)
			xscale = move;
	}
	else
	{
		if IT_april_swing()
		{
			hsp = xscale * movespeed;
			if (scr_solid(x + xscale, y) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
				xscale *= -1;
			
	        if (swingdingbuffer == 0 && !key_attack)
	            swingdingbuffer = -1;
	        if (swingdingbuffer == -1)
	            movespeed = Approach(movespeed, 0, 0.5);
			
	        if (movespeed == 0)
	            sprite_index = spr_haulingidle;
		}
		if IT_final_swing()
		{
			if (grounded)
				movespeed = Approach(movespeed, 0, 0.25);
			if (movespeed <= 0)
				sprite_index = spr_haulingidle;
			swingdingendcooldown++;
			hsp = xscale * movespeed;
			
			if (scr_solid(x + xscale, y) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
				swingdingthrow = true;
			with (instance_place(x + xscale, y, obj_destructibles))
				instance_destroy();
			
			if movespeed == 2
				sprite_index = spr_haulingidle;
		}
		
		// sound
		if (floor(image_index) == 0 && spinsndbuffer == 0)
		{
			sound_play_3d("event:/sfx/pep/spin", x, y);
			spinsndbuffer = 5;
		}
		else if (spinsndbuffer > 0)
			spinsndbuffer--;
		if (floor(image_index) == 0)
			spinsndbuffer = 5;
	}
	if ((can_jump && input_buffer_jump > 0 && !key_down && !key_attack && vsp > 0) && sprite_index != spr_swingding)
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		sprite_index = spr_haulingjump;
		instance_create(x, y, obj_highjumpcloud2);
		if (heavy == 0)
			vsp = -11;
		else
			vsp = -6;
		image_index = 0;
	}
	
	if (grounded && move != 0 && sprite_index == spr_haulingidle)
		sprite_index = spr_haulingwalk;
	else if (grounded && move == 0 && sprite_index == spr_haulingwalk)
		sprite_index = spr_haulingidle;
	if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
		sprite_index = spr_haulingidle;
	if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) || (!grounded && (sprite_index == spr_haulingwalk || sprite_index == spr_haulingidle)))
		sprite_index = spr_haulingfall;
	if (grounded && vsp > 0 && (sprite_index == spr_haulingfall || sprite_index == spr_haulingjump))
		sprite_index = spr_haulingland;
	if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
		sprite_index = spr_haulingidle;
	
	// fun april swingding
	if IT_april_swing()
	{
		if (key_attack && (sprite_index != spr_swingding))
	    {
	        swingdingbuffer = 0;
	        sprite_index = spr_swingding;
	        with (instance_create(x, y, obj_jumpdust))
				copy_player_scale(other);
	        movespeed = 12;
	        with (instance_create(x, y, obj_swingdinghitbox))
	            playerid = other.id;
	        flash = true;
	    }
	    if (swingdingbuffer > 0)
	    {
	        swingdingbuffer--;
	        if (movespeed > 0)
	            movespeed -= 0.1;
	    }
	}
	
	if scr_slapbuffercheck() && sprite_index != spr_swingding
	{
		scr_resetslapbuffer();
		if (move != 0)
			move = xscale;
		
		if !IT_static_finishingblow()
		{
			hsp = xscale * movespeed;
			movespeed = hsp;
		}
		else
		{
			hsp = 0;
			movespeed = 0;
		}
		
		state = states.finishingblow;
		if (!key_up)
			sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
		else if (key_up)
			sprite_index = spr_uppercutfinishingblow;
		image_index = 0;
	}
	else if IT_swingding_throw() && ((scr_slapbuffercheck() && sprite_index == spr_swingding && swingdingendcooldown > 20) || swingdingthrow)
	{
		//if (fmod_event_instance_is_playing("event:/sfx/pep/spin"))
		//	fmod_event_instance_stop("event:/sfx/pep/spin", true);
		scr_resetslapbuffer();
		if (move != 0)
			move = xscale;
		hsp = xscale * movespeed;
		swingdingendcooldown = 0;
		swingdingthrow = false;
		state = states.finishingblow;
		sprite_index = spr_swingdingend;
		image_index = 0;
	}
	
	if (scr_check_groundpound2() && !grounded)
	{
		sprite_index = spr_piledriver;
		if SUGARY_SPIRE && character == "SP"
			sprite_index = spr_playerSP_piledriverstart;
		dir = xscale;
		vsp = -5;
		state = states.superslam;
		image_index = 0;
		image_speed = 0.35;
	}
	if (grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		create_particle(x, y + 43, part.cloudeffect);
	
	if (key_down && grounded && ((sprite_index != spr_swingding && sprite_index != spr_swingdingend) or !IT_final_swing()))
	{
		with obj_swingdinghitbox
			if playerid == other.id instance_destroy();
		
		state = states.crouch;
		landAnim = false;
		crouchAnim = true;
		image_index = 0;
		idle = 0;
	}
	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
		steppy = true;
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = false;
	if (sprite_index != spr_swingding)
		image_speed = 0.35;
	else if (heavy == 1)
		image_speed = 0.1;
	else
		image_speed = 0.5;
	if (grabbingenemy && !instance_exists(baddiegrabbedID))
	{
		state = states.normal;
		landAnim = false;
		image_index = 0;
	}
}
