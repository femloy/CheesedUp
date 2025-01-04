function scr_player_handstandjump()
{
	var maxmovespeed = 10;
	var accel = 0.5;
	var jumpspeed = IT_jumpspeed();
	
	landAnim = false;
	hsp = xscale * movespeed;
	move = key_left + key_right;
	momemtum = true;
	dir = xscale;
	
	// sprites
	var attackdash = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;
	var airattackdash = spr_suplexdashjump;
	var airattackdashstart = spr_suplexdashjumpstart;
	
	if shoot
		attackdash = spr_player_pistolshot;
	
	if sprite_index == spr_attackdash or sprite_index == spr_airattack or sprite_index == spr_airattackstart
	{
		attackdash = spr_attackdash;
		airattackdash = spr_airattack;
		airattackdashstart = spr_airattackstart;
	}
	else if sprite_index == spr_lunge
	{
		attackdash = spr_lunge;
		accel = 0.8;
		vsp = 0;
	}
	else
	{
		// old animation is shorter
		var animskip = IT_grab_animation_skip();
		if animskip != undefined && grounded
		{
			if floor(image_index) == animskip[0]
				image_index += animskip[1];
		}
	}
	
	// acceleration
	if movespeed < maxmovespeed
		movespeed += accel;
	
	// double tap move
	if scr_slapbuffercheck()
	{
		scr_resetslapbuffer();
		scr_perform_move(MOD_MOVE_TYPE.doublegrab);
	}
	
	// jump
	if !key_jump2 && !jumpstop && vsp < 0.5 && !stompAnim
	{
		vsp /= 20;
		jumpstop = true;
	}
	
	if input_buffer_jump > 0 && (can_jump or sprite_index == spr_lunge) && !key_down
	{
		input_buffer_jump = 0;
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust, 0);
		jumpstop = false;
		image_index = 0;
		vsp = jumpspeed;
		
		if !CHAR_POGONOISE && IT_grabjump_mach2()
		{
			state = states.mach2;
			if IT_longjump() && (character == "P" or spr_longjump != spr_player_longjump)
			{
				fmod_event_instance_play(rollgetupsnd);
				sprite_index = spr_longjump;
			}
			else
				sprite_index = spr_mach2jump;
		}
	}
	
	// end ungrounded grab
	if grounded && sprite_index == airattackdash
	{
		if !key_attack || CHAR_POGONOISE
		{
			if sprite_index != spr_lunge
			{
				state = states.normal;
				if move != xscale
					movespeed = 2;
			}
			else
				image_index = image_number - 6;
		}
		else
			state = states.mach2;
	}
	
	// end grounded grab
	if floor(image_index) == image_number - 1 && sprite_index == attackdash
	{
		if key_attack && !CHAR_POGONOISE
		{
			image_speed = 0.35;
			state = states.mach2;
			grav = 0.5;
		}
		else
			state = states.normal;
	}
	
	// crouchslide
	if scr_mach_check_dive() && grounded
		scr_modmove_crouchslide();
	
	// wallclimbing from grab
	if IT_grab_climbwall() && !CHAR_POGONOISE
	{
		if scr_preventbump(states.handstandjump) && ((!grounded && (check_solid(x + hsp, y) || scr_solid_slope(x + hsp, y)) && !check_slope(x, y - 1))
		|| (grounded && (check_solid(x + sign(hsp), y - 16) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_metalblock) && scr_slope()))
		{
			var _climb = true;
			if CHAR_BASENOISE
				_climb = ledge_bump(32, abs(hsp) + 1);
			if _climb
			{
				if REMIX
				{
					for(var xx = 0; xx < 32; xx++)
					{
						if scr_solid(x + xx * xscale, y)
						{
							x += (xx - 1) * xscale;
							break;
						}
					}
					hsp = 0;
				}
				
				if !place_meeting(x + hsp, y, obj_unclimbablewall)
					wallspeed = 6;
				else
					wallspeed = -vsp;
				
				grabclimbbuffer = 10;
				state = states.climbwall;
				
				if REMIX
					vsp = -wallspeed;
			}
		}
	}
	
	// bump on wall
	if state != states.climbwall && scr_solid(x + xscale, y) && scr_preventbump(states.handstandjump) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if _bump
		{
			if !IT_old_grab_bump()
			{
				// splat
				sound_play_3d("event:/sfx/pep/splat", x, y);
				jumpstop = true;
				state = states.jump;
				vsp = -4;
				sprite_index = spr_suplexbump;
				instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
			}
			else
			{
				// bump
				sound_play_3d(sfx_bumpwall, x, y);
				hsp = -2.5 * xscale;
				vsp = -3;
				image_index = 0;
				state = states.bump;
				instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
			}
		}
	}
	
	// grab cancel
	if state != states.bump && move != xscale && move != 0
	{
		image_index = 0;
		if !grounded && IT_grab_cancel()
		{
			sound_play_3d("event:/sfx/pep/grabcancel", x, y);
			sprite_index = spr_suplexcancel;
			jumpAnim = true;
			grav = 0.5;
			state = states.jump;
		}
		else
		{
			state = states.normal;
			movespeed = 2;
			grav = 0.5;
		}
	}
	
	if scr_modding_hook_falser("player/suplexdash/anim")
	{
		// animation
		if sprite_index == attackdash && !grounded && sprite_index != spr_lunge
		{
			image_index = 0;
			sprite_index = airattackdashstart;
		}
		if floor(image_index) == image_number - 1 && sprite_index == airattackdashstart
			sprite_index = airattackdash;
		image_speed = 0.35;
		
		// particle
		if !instance_exists(obj_slidecloud) && grounded && movespeed > 5
		{
			with instance_create(x, y, obj_slidecloud)
				copy_player_scale(other);
		}
	}
}
