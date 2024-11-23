function scr_player_tumble()
{
	//if live_call() return live_result;
	
	if do_vigislide && character == "V"
	{
		do_vigislide = false;
		if grounded && movespeed < 12 && sprite_index != spr_crouchslip && sprite_index != spr_tumble
		{
			sound_instance_move(snd_vigislide, x, y);
			fmod_event_instance_play(snd_vigislide);
			
			flash = true;
			sprite_index = spr_playerV_divekickstart;
			image_index = 0;
			
			movespeed = 14;
			vigi_slide_buffer = 15;
		}
	}
	
	var machrollspr = sprite_index == spr_playerV_divekickstart ? sprite_index : spr_machroll;
	var divespr = spr_dive;
	var crouchslipspr = spr_crouchslip;
	
	if isgustavo
	{
		machrollspr = spr_lonegustavo_roll;
		divespr = spr_lonegustavogroundpound;
		crouchslipspr = spr_lonegustavocrouchwalk;
	}
	
	// vigi states
	if sprite_index == spr_playerV_divekickstart && image_index >= image_number - 1
		sprite_index = spr_machroll;
	if character == "V" && grounded && sprite_index != spr_crouchslip
		movespeed = Approach(movespeed, 12, 0.1);
	
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (xscale * movespeed) + (railmovespeed * raildir);
	move = key_right + key_left;
	mask_index = spr_crouchmask;
	if (sprite_index == spr_tumblestart)
		movespeed = 6;
	if (!grounded && (sprite_index == crouchslipspr || sprite_index == machrollspr || sprite_index == spr_mach2jump || sprite_index == spr_backslide || sprite_index == spr_backslideland) && !CHAR_POGONOISE)
	{
		if (CHAR_BASENOISE)
		{
			sprite_index = spr_playerN_divebomb;
			state = states.machcancel;
			savedmove = xscale;
			vsp = 20;
			movespeed = hsp;
			input_buffer_slap = 0;
			input_buffer_jump = 0;
			image_index = 0;
			exit;
		}
		else
		{
			vsp = 10;
			sprite_index = divespr;
			fmod_event_instance_play(snd_dive);
		}
	}
	if (sprite_index == spr_tumble)
	{
		if IT_FINAL
		{
			if grounded
			{
				if (move == xscale)
					movespeed = Approach(movespeed, 12, 0.25);
				else if (move == -xscale)
					movespeed = Approach(movespeed, 8, 0.25);
				else
					movespeed = Approach(movespeed, 10, 0.25);
			}
		}
		else
			movespeed = 14;
	}
	if (grounded && sprite_index == divespr)
	{
		sprite_index = machrollspr;
		image_index = 0;
	}
	if (sprite_index == divespr && key_jump && !isgustavo)
	{
		if !CHAR_BASENOISE
		{
			sprite_index = spr_poundcancel1;
			if SUGARY_SPIRE && character == "SP"
				sprite_index = spr_playerSP_poundcancel1;
			image_index = 0;
			state = states.freefall;
			dir = xscale;
			vsp = -6;
		}
		else
		{
			sprite_index = spr_playerN_divebomb;
			state = states.machcancel;
			vsp = 20;
			hsp = 0;
			savedmove = xscale;
			movespeed = 0;
			input_buffer_slap = 0;
			input_buffer_jump = 0;
			image_index = 0;
			exit;
		}
	}
	if (movespeed <= 2 && sprite_index != spr_tumble && sprite_index != spr_breakdance)
		state = states.normal;
	if (!scr_slope() && sprite_index == spr_tumblestart && floor(image_index) < 11)
		image_index = 11;
	if (sprite_index == spr_mach2jump && grounded)
	{
		image_index = 0;
		sprite_index = machrollspr;
	}
	if (sprite_index == spr_mach2jump && grounded)
	{
		image_index = 0;
		sprite_index = machrollspr;
	}
	if (sprite_index == crouchslipspr && !grounded && character == "P")
		sprite_index = spr_player_jumpdive2;
	if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_Sjumpcancelslide;
	if (sprite_index == spr_player_jumpdive2 && grounded)
		sprite_index = crouchslipspr;
	if ((character == "P" or spr_backslideland != spr_player_backslideland) && floor(image_index) == (image_number - 1) && sprite_index == machrollspr && movespeed > 12)
	{
		sprite_index = spr_backslideland;
		image_index = 0;
	}
	if (sprite_index == machrollspr && !grounded)
		sprite_index = spr_mach2jump;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_backslideland)
		sprite_index = spr_backslide;
	if (sprite_index == spr_player_Sjumpcancel && grounded)
		sprite_index = spr_player_Sjumpcancelland;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
		sprite_index = spr_player_Sjumpcancelslide;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_breakdance)
	{
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust, 0);
		movespeed = 12;
		sprite_index = spr_breakdancesuper;
	}
	if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_tumble;
		movespeed = 14;
	}
	if state != states.freefall && ((check_solid(x + xscale, y) || scr_solid_slope(x + xscale, y))
	&& !place_meeting(x + hsp, y, obj_rollblock) && !place_meeting(x + hsp, y, obj_unbumpablewall)
	&& (!place_meeting(x + hsp, y, obj_rattumble) || sprite_index != spr_tumble) && !place_meeting(x + hsp, y, obj_destructibles)
	&& (!SUGARY_SPIRE or !place_meeting(x + hsp, y, obj_metalblock) or character != "SP" or sprite_index != spr_machroll or abs(hsp) < 12))
	&& ((!place_meeting(x + hsp, y, obj_ratblock1x1) && (!place_meeting(x + hsp, y, obj_rattumble) or place_meeting(x + hsp, y, obj_rattumble_big))) or character != "V")
	|| place_meeting(x, y, obj_timedgate)
	{
		if character != "V"
		{
			hsp = 0;
			movespeed = 0;
		}
		if (sprite_index == spr_tumble || sprite_index == spr_tumblestart)
		{
			sound_play_3d("event:/sfx/pep/bumpwall", x, y);
			state = states.bump;
			landAnim = false;
			sprite_index = spr_tumbleend;
			image_index = 0;
			hsp = -xscale * 2;
			vsp = -3;
			jumpstop = true;
		}
		else if character == "V"// && scr_check_dive()
		{
			sound_play_3d(sfx_mach2bump, x, y);
			sound_play_3d(sfx_pepperman_groundpoundbump, x, y);
			
			if movespeed < 16
				movespeed = min(movespeed + 2, 16);
			instance_create(x + xscale * 25, y + 35, obj_bumpeffect);
			xscale *= -1;
		}
		else
		{
			sound_play_3d("event:/sfx/pep/splat", x, y);
			state = states.bump;
			image_index = 0;
			sprite_index = spr_wallsplat;
		}
	}
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0 && !place_meeting(x, y, obj_bigcheese))
		jumpstop = false;
	if (input_buffer_jump > 0 && can_jump && state != states.bump && hsp != 0 && sprite_index == spr_tumble && !place_meeting(x, y, obj_pinballlauncher) && !place_meeting(x, y, obj_bigcheese))
	{
		if (!scr_solid(x, y - 16))
		{
			with (instance_create(x, y, obj_highjumpcloud2))
				copy_player_scale(other);
			vsp = -11;
			scr_fmod_soundeffect(jumpsnd, x, y);
		}
	}
	if (crouchslipbuffer > 0)
		crouchslipbuffer--;
	
	if (!key_down && crouchslipbuffer <= 0 && grounded && state != states.bump && (sprite_index != spr_tumblestart && sprite_index != spr_tumble && sprite_index != spr_tumbleend) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_breakdance)
	&& vigi_slide_buffer <= 0
	{
		if key_attack && !CHAR_POGONOISE
		{
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust);
				
			if isgustavo
			{
				state = states.ratmount;
				ratmount_movespeed = movespeed;
				movespeed *= xscale;
			}
			else if (movespeed >= 12)
				state = states.mach3;
			else
				state = states.mach2;
				
			image_index = 0;
			sprite_index = spr_rollgetup;
			fmod_event_instance_play(rollgetupsnd);
		}
		else if vsp > 0
		{
			if isgustavo
			{
				movespeed = 0;
				state = states.ratmount;
			}
			else if movespeed > 6 && !CHAR_POGONOISE
			{
				state = states.machslide;
				sprite_index = spr_machslidestart;
				image_index = 0;
			}
			else
				state = states.normal;
		}
	}
	
	if !IT_FINAL
		image_speed = 0.35;
	else if sprite_index == spr_playerV_divekickstart
		image_speed = 0.5;
	else if (sprite_index == crouchslipspr || sprite_index == spr_breakdancesuper || sprite_index == machrollspr || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump)
		image_speed = abs(movespeed) / 15;
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
		image_speed = 0;
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
		image_speed = 0;
	else
		image_speed = 0.35;
	
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			copy_player_scale(other);
			other.dashcloudid = id;
		}
	}
	if (sprite_index == spr_dive && vsp < 10)
		vsp = 10;
}
