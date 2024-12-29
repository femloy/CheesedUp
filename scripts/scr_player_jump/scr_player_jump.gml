function state_player_jump()
{
	var maxmovespeed = IT_walkspeed(); // 8
	var maxmovespeed2 = 6;
	var turnmovespeed = 2;
	var accel = 0.5;
	var deccel = 0.1;
	var jumpspeed = -11;
	var machspeed = 6;
	
	if character == "MS"
		jumpspeed = scr_stick_jumpspeed();
	
	landAnim = true;
	
	// momentum
	if (!momemtum)
		hsp = move * movespeed;
	else
		hsp = xscale * movespeed;
	hsp += (railmovespeed * raildir);
	
	/*
	if (key_taunt2)
	{
		input_finisher_buffer = 60;
		input_attack_buffer = 0;
		input_up_buffer = 0;
		input_down_buffer = 0;
	}
	*/
	
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = turnmovespeed;
		facehurt = false;
	}
	if (move != xscale)
		movespeed = turnmovespeed;
	
	move = key_left + key_right;
	if (movespeed == 0)
		momemtum = false;
	
	if (scr_solid(x + hsp, y))
	{
		movespeed = 0;
		mach2 = 0;
	}
	
	// moving
	if (move != 0)
	{
		xscale = move;
		if (movespeed < maxmovespeed)
			movespeed += accel;
		else if (floor(movespeed) == maxmovespeed)
			movespeed = maxmovespeed2;
		if (scr_solid(x + xscale, y) && move == xscale)
			movespeed = 0;
	}
	else
		movespeed = 0;
	
	if (movespeed > maxmovespeed)
		movespeed -= deccel;
	
	if (ladderbuffer > 0)
		ladderbuffer--;
	if (!jumpstop)
	{
		if (!key_jump2 && vsp < 0.5 && !stompAnim)
		{
			vsp /= 20;
			jumpstop = true;
		}
		else if (scr_solid(x, y - 1) && !jumpAnim)
		{
			vsp = grav;
			jumpstop = true;
		}
	}
	
	if (key_jump && wallclingcooldown == 10)
	{
		if (check_solid(x + xscale, y) && CHAR_POGONOISE)
		{
			sound_play_3d(landsnd, x, y);
			sprite_index = spr_playerN_wallclingstart;
			image_index = 0;
			state = states.hang;
			xscale *= -1;
			vsp = 0;
			doublejump = false;
		}
		else if (!doublejump && sprite_index != spr_freefall && sprite_index != spr_facestomp)
		&& (CHAR_POGONOISE or (SUGARY_SPIRE && character == "SN"))
		{
			if SUGARY_SPIRE && character == "SN"
			{
				scr_fmod_soundeffect(jumpsnd, x, y);
				sprite_index = spr_pizzano_doublejump;
				vsp = -10;
			}
			else
			{
				sound_play_3d("event:/modded/sfx/woosh", x, y);
				sprite_index = spr_playerN_doublejump;
				vsp = -9;
				jumpAnim = true;
			}
			image_index = 0;
			jumpstop = false;
			doublejump = true;
			particle_set_scale(part.highjumpcloud2, xscale, 1);
			create_particle(x, y, part.highjumpcloud2, 0);
		}
	}
	if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
	{
		if (vsp > 6)
			vsp = 6;
		if (!key_jump2)
		{
			grav = 0.5;
			sprite_index = spr_fall;
		}
	}
	if (key_jump)
	{
		if (global.mort && sprite_index != spr_mortdoublejump)
		{
			repeat (6)
				create_debris(x, y, spr_feather);
			sprite_index = spr_mortdoublejump;
			image_index = 0;
			jumpstop = false;
			grav = 0.25;
			mort = true;
		}
	}
	if (can_jump && input_buffer_jump > 0 && ((!key_down && !key_attack) or character == "S") && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		stompAnim = false;
		vsp = jumpspeed;
		state = states.jump;
		jumpAnim = true;
		jumpstop = false;
		freefallstart = 0;
		railmomentum = false;
		if (place_meeting(x, y + 1, obj_railparent))
			railmomentum = true;
		if (sprite_index != spr_shotgunshoot)
		{
			sprite_index = spr_jump;
			if (shotgunAnim)
				sprite_index = spr_shotgunjump;
			if (global.pistol && character != "N")
				sprite_index = spr_player_pistoljump1;
			image_index = 0;
		}
		particle_set_scale(part.highjumpcloud2, xscale, 1);
		create_particle(x, y, part.highjumpcloud2, 0);
	}
	if (!can_jump && CHAR_BASENOISE && key_up && noisedoublejump && input_buffer_jump > 0 && !key_down && !key_attack)
	{
		freefallstart = 0;
		railmomentum = false;
		if (place_meeting(x, y + 1, obj_railparent))
			railmomentum = true;
		scr_player_do_noisecrusher();
	}
	if (grounded && vsp > 0)
	{
		if (vsp > 0 && (!key_attack || sprite_index == spr_suplexbump or character == "S"))
		{
			sound_play_3d(landsnd, x, y);
			if (key_attack || sprite_index == spr_shotgunshoot)
				landAnim = false;
			if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
				sprite_index = spr_player_mortland;
			if (sprite_index != spr_shotgunshoot)
				image_index = 0;
			if (global.pistol && character != "N")
				sprite_index = spr_player_pistolland;
			input_buffer_secondjump = 0;
			state = states.normal;
			jumpAnim = true;
			jumpstop = false;
			freefallstart = 0;
			create_particle(x, y, part.landcloud, 0);
		}
	}
	if (vsp > 5 && sprite_index != spr_mortdoublejump)
		fallinganimation++;
	if (fallinganimation >= 40 && fallinganimation < 80)
		sprite_index = spr_facestomp;
	else if (fallinganimation >= 80)
		sprite_index = spr_freefall;
	if (!stompAnim)
	{
		if (!jumpAnim)
		{
			switch (sprite_index)
			{
				case spr_mortdoublejumpstart:
					sprite_index = spr_mortdoublejump;
					break;
				case spr_suplexland:
					sprite_index = spr_fall;
					break;
				case spr_playerN_doublejump:
					sprite_index = spr_playerN_doublejumpfall;
					break;
				case spr_airdash1:
					sprite_index = spr_airdash2;
					break;
				case spr_player_pistolshot:
					sprite_index = spr_player_pistoljump2;
					break;
				case spr_shotgunjump:
					sprite_index = spr_shotgunfall;
					break;
				case spr_playerV_superjump:
					sprite_index = spr_playerV_fall;
					break;
				case spr_jump:
					sprite_index = spr_fall;
					break;
				case spr_player_pistoljump1:
					sprite_index = spr_player_pistoljump2;
					break;
				case spr_suplexcancel:
					sprite_index = spr_fall;
					break;
				case spr_player_backflip:
				case spr_playerN_suplexland:
					sprite_index = spr_fall;
					break;
				case spr_player_Sjumpstart:
					sprite_index = spr_player_Sjump;
					break;
				case spr_player_shotgunjump1:
					sprite_index = spr_player_shotgunjump2;
					break;
				case spr_shotgun_shootair:
					sprite_index = spr_shotgunfall;
					break;
				case spr_shotgunshoot:
					sprite_index = spr_shotgunfall;
					break;
				case spr_stompprep:
					sprite_index = spr_stomp;
					break;
				case spr_groundpoundjump:
					sprite_index = spr_fall;
					break;
				case spr_player_candytransitionup:
					sprite_index = spr_player_candyup;
					break;
			}
		}
	}
	else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
		sprite_index = spr_stomp;
	if (scr_check_groundpound() && !global.kungfu)
	{
		input_buffer_slap = 0;
		image_index = 0;
		pistolanim = noone;
		state = IT_final_freefall() ? states.freefall : states.freefallprep;
		
		if (!shotgunAnim)
		{
			sprite_index = spr_bodyslamstart;
			if IT_final_freefall()
				vsp = -6;
			else
				vsp = CHAR_OLDNOISE ? -7 : -5;
		}
		else if (character != "N")
		{
			sound_play_3d("event:/sfx/enemies/killingblow", x, y);
			sprite_index = spr_shotgunjump1;
			vsp = -11;
			
			with (instance_create(x, y, obj_shotgunblast))
			{
				sprite_index = spr_shotgunblastdown;
				with (bulletID)
				{
					sprite_index = other.sprite_index;
					mask_index = other.mask_index;
				}
			}
		}
		else
		{
			notification_push(notifs.shotgunblast_start, [room]);
			state = states.shotgunshoot;
			minigunshot = 3;
			minigunbuffer = 0;
			sprite_index = spr_playerN_minigundown;
			image_index = 0;
		}
	}
	if (sprite_index == spr_player_suplexcancel or sprite_index == sprite_index == spr_playerN_noisebombspinjump)
		image_speed = 0.4;
	else
		image_speed = 0.35;
	if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		sound_play_3d("event:/sfx/pep/groundpound", x, y);
		image_index = 0;
		sprite_index = spr_bodyslamland;
		if SUGARY_SPIRE && character == "SP"
			sprite_index = spr_playerSP_freefallland;
		state = states.freefallland;
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		shake_camera(10, 30 / room_speed);
	}
	
	if character == "MS" && scr_slapbuffercheck()
		scr_stick_doattack();
	
	if character != "V" && character != "S" && character != "MS"
	{
		if (input_buffer_shoot > 0 && shotgunAnim)
			scr_shotgunshoot();
		else if (input_buffer_pistol > 0 && global.pistol)
		or (global.shootstyle == SHOOT_STYLES.pistol && key_shoot2)
			scr_pistolshoot(states.jump);
		else if key_shoot2
			scr_perform_move(MOD_MOVES.shootattack, states.jump);
		var pistol = (global.pistol && character != "N");
		
		// suplex dash
		var allow_uppercut = IT_allow_uppercut();
		if (input_buffer_grab > 0 && (!key_up or !allow_uppercut) && sprite_index != spr_suplexbump && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol)) && (!suplexmove or !IT_grab_suplexmove_check()))
		{
			input_buffer_slap = 0;
			input_buffer_grab = 0;
			
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			image_index = 0;
			sprite_index = spr_suplexdashjumpstart;
			if SUGARY_SPIRE && character == "SP"
				sprite_index = spr_suplexdash;
			suplexmove = true;
			fmod_event_instance_play(suplexdashsnd);
			state = states.handstandjump;
			movespeed = IT_suplexspeed();
			
			var v = IT_grab_vsp();
			if v != undefined
				vsp = v;
		}
	
		// uppercut
		else if allow_uppercut && ((input_buffer_slap > 0 or input_buffer_grab > 0) && key_up && ((shotgunAnim == false && !pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !pistol)))
		{
			input_buffer_slap = 0;
			input_buffer_grab = 0;
			state = states.punch;
			image_index = 0;
			sprite_index = spr_breakdanceuppercut;
			fmod_event_instance_play(snd_uppercut);
			
			if character == "V"
				vsp = vigi_uppercut_vsp();
			else if character == "N"
				vsp = -21;
			else
				vsp = -10;
			
			movespeed = hsp;
			if global.banquet && key_attack && grounded // high jump going left
				movespeed = abs(hsp);
			
			particle_set_scale(part.highjumpcloud2, xscale, 1);
			create_particle(x, y, part.highjumpcloud2, 0);
			
			if character == "N"
			{
				repeat (4)
				{
					with (instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect))
					{
						sprite_index = spr_shineeffect;
						image_speed = 0.35;
					}
				}
			}
		}
	
		// kungfu
		else if input_buffer_slap > 0 && !suplexmove && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol))
		{
			input_buffer_slap = 0;
			scr_perform_move(MOD_MOVES.grabattack, states.jump);
		}
	}
	
	/*
	if (key_slap2 && shoot)
	{
		if (!shotgunAnim)
		{
			flash = true;
			if (!instance_exists(parry_inst) && flash == 1)
			{
				parry_inst = instance_create(x, y, obj_parryhitbox);
				var _playerid = 1;
				if (object_index == obj_player2)
					_playerid = 2;
				with (parry_inst)
				{
					player_id = _playerid;
					image_xscale = other.xscale;
				}
			}
			if (global.mort)
			{
				with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
				{
					image_xscale = other.xscale;
					sprite_index = spr_mortprojectile;
				}
				sprite_index = spr_mortthrow;
				image_index = 0;
				state = states.pistol;
				mort = true;
				shake_camera(3, 3 / room_speed);
			}
			else if (character != "V" && shoot)
			{
				sprite_index = spr_pistolshot;
				image_index = 0;
				movespeed = 5;
				state = states.handstandjump;
				shoot = true;
				with obj_camera
				{
					shake_mag = 3;
					shake_mag = 3 / room_speed;
				}
				if (character != "N")
				{
					with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
					{
						pistol = true;
						sprite_index = spr_peppinobullet;
						image_xscale = other.xscale;
					}
				}
				else
				{
					with (instance_create(x, y, obj_playerbomb))
					{
						kick = true;
						movespeed = 15;
						image_xscale = other.xscale;
					}
				}
			}
			else if (character != "V")
			{
			}
		}
	}
	*/
	
	// mach running
	if !CHAR_POGONOISE
	{
		if (key_attack && grounded && fallinganimation < 40)
		{
			sprite_index = spr_mach1;
			image_index = 0;
					
			if !IT_mach1_state()
			{
				state = states.mach2;
				movespeed = max(movespeed, machspeed);
			}
			else
			{
				state = states.mach1;
				movespeed = machspeed;
			}
		}
	}
	
	// pogo noise
	else
	{
		if (key_attack2 && (pogochargeactive or pizzapepper > 0))
		{
			sprite_index = !key_up ? spr_playerN_jetpackstart : spr_superjumpprep;
			sound_play_3d(sfx_woag, x, y)
			jetpackcancel = true;
			if sprite_index == spr_playerN_jetpackstart && REMIX
				sound_play_3d(sfx_jetpackstart, x, y)
			image_index = 0;
			hsp = 0;
			vsp = 0;
			state = states.Sjumpprep;
		}
		if (key_attack && !pogochargeactive && !key_slap2 && pizzapepper == 0)
		{
			sprite_index = spr_playerN_pogostart;
			image_index = 0;
			state = states.pogo;
		}
	}
	
	// vigi moves
	if character == "V"
	{
		scr_vigi_shoot();
		scr_vigi_throw();
		
		if sprite_index == spr_playerV_superjump && floor(image_index) == image_number - 1
			create_particle(x, y + 25, part.shotgunimpact, 0);
	}
	
	if (!key_attack || move != xscale)
		mach2 = 0;
	if (floor(image_index) == (image_number - 1))
		jumpAnim = false;
	if (sprite_index == spr_playerN_ratballoonbounce && floor(image_index) == (image_number - 1))
		image_index = image_number - 1;
	scr_dotaunt();
	if (sprite_index == spr_shotgunshoot)
	{
		landAnim = false;
		machslideAnim = false;
		image_speed = 0.45;
		if (image_index > (image_number - 1))
			sprite_index = spr_shotgunfall;
	}
	if (check_solid(x, y))
	{
		state = states.crouch;
		landAnim = false;
		crouchAnim = true;
		image_index = 0;
		idle = 0;
	}
}
function state_pepperman_jump()
{
	pepperman_grab_reset();
	move = key_left + key_right;
	if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel_air;
	else if (move != 0 && move != sign(xscale) && movespeed > 0)
		movespeed -= pepperman_deccel_air;
	else if (move == 0)
		movespeed -= pepperman_deccel_air;
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal;
	if (movespeed > pepperman_maxhsp_normal)
		movespeed -= 0.3;
	else if (movespeed < 0)
		movespeed = 0;
	if (move != 0 && movespeed == 0)
		xscale = move;
	hsp = xscale * movespeed;
	if (sprite_index == spr_jump && floor(image_index) == (image_number - 1))
		sprite_index = spr_fall;
	if (sprite_index == spr_player_pistoljump1 && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_pistoljump2;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
	{
		state = states.normal;
		instance_create(x, y - 5, obj_landcloud); // unused
	}
	if (scr_check_groundpound() && !grounded)
	{
		state = states.freefall;
		freefallsmash = 12;
		vsp = 14;
		sprite_index = spr_bodyslamfall;
	}
	if (key_attack && (!check_solid(x + xscale, y) || place_meeting(x + xscale, y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw)
	{
		if (move != 0)
			xscale = move;
		state = states.shoulderbash;
		sprite_index = spr_pepperman_shoulderstart;
		image_index = 0;
	}
	if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
		sprite_index = spr_pepperman_fall;
	if (ladderbuffer > 0)
		ladderbuffer--;
	if (key_taunt2)
	{
		sound_play_3d("event:/sfx/pep/taunt", x, y)
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredvsp = vsp;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		state = states.backbreaker;
		if (supercharged == 1)
		{
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
		}
		else
		{
			taunttimer = 20;
			image_index = random_range(0, 11);
			sprite_index = spr_taunt;
		}
		with (instance_create(x, y, obj_taunteffect))
			player = other.id;
	}
}
function state_snick_jump()
{
	state_snick_normal();
}
function scr_player_jump()
{
	if character == "S"
		state_snick_jump();
	else if (character != "M")
		state_player_jump();
	else
		state_pepperman_jump();
}
