function state_player_normal()
{
	var maxmovespeed = IT_walkspeed(); // 8
	var maxmovespeed2 = 6; // bug, and image speed limit.
	var accel = 0.5;
	var deccel = 0.1;
	var jumpspeed = -11;
	var suplexspeed = IT_suplexspeed(); // 8
	
	if character == "MS"
		jumpspeed = scr_stick_jumpspeed();
	
	// gustavo failsafe
	if isgustavo && !CHAR_BASENOISE
	{
		brick = true;
		state = states.ratmount;
	}
	
	mach2 = 0;
	move = key_left + key_right;
	skateboarding = false;
	momemtum = false;
	jumpstop = false;
	
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 2;
		facehurt = false;
	}
	
	// no fucking clue.
	/*
	if (key_taunt2)
	{
		input_finisher_buffer = 60;
		input_attack_buffer = 0;
		input_up_buffer = 0;
		input_down_buffer = 0;
	}
	*/
	
	// decide on sprites
	var idlespr = spr_idle;
	var movespr = spr_move;
	
	if IT_freezing_idle() && global.leveltosave == "freezer" && !global.noisejetpack
		idlespr = spr_freezeridle;
	if global.pistol && character != "N"
	{
		idlespr = spr_player_pistolidle;
		movespr = spr_player_pistolwalk;
	}
	if (instance_exists(obj_soundtest) && obj_soundtest.play) or global.jukebox != noone
	or (SUGARY_SPIRE && global.leveltosave == "dance")
	{
		idlespr = spr_pepdance;
		movespr = spr_pepdance;
		
		switch character
		{
			case "N":
				idlespr = spr_noise_vulnerable2;
				movespr = spr_noise_vulnerable2;
				break;
		}
		if SUGARY_SPIRE
		{
			if character == "SP"
			{
				idlespr = spr_playerSP_danceidle;
				movespr = spr_playerSP_dancewalk;
			}
		}
		idle = 0;
	}
	
	// breakdancing
	var breakdance_max = 10;
	if IT_taunt_breakdance()
	{
		if (key_taunt && !shotgunAnim && (!global.pistol or character == "N"))
		{
			pistol = false;
			breakdance_pressed++;
		}
		else
			breakdance_pressed = 0;
		if (breakdance_pressed >= breakdance_max && !shotgunAnim)
		{
			breakdance_speed = Approach(breakdance_speed, 0.6, 0.005);
			if (breakdance_pressed - 1 < breakdance_max)
				notification_push(notifs.breakdance, []);
		}
		else
			breakdance_speed = 0.25;
		if (breakdance_speed >= 0.5)
		{
			if (!instance_exists(obj_beatbox))
			{
				create_particle(x, y, part.genericpoofeffect);
				with (instance_create(x, y, obj_beatbox))
					vsp = -11;
			}
			notecreate--;
		}
		if (notecreate <= 0 && !shotgunAnim)
		{
			with instance_create(x + random_range(-70, 70), y + random_range(-70, 70), obj_notes)
			{
				if other.character == "V"
					sprite_index = spr_breakdancenotes_vigi;
				if other.character == "SP"
					sprite_index = spr_breakdancenotes_pizzelle;
			}
			notecreate = 10;
		}
	}
	else
		breakdance_pressed = 0;
	
	// rails
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
		railmomentum = true;
	}
	
	// moving
	hsp = (move * movespeed) + (railmovespeed * raildir);
	if (move != 0)
	{
		xscale = move;
		
		// acceleration
		if (movespeed < maxmovespeed)
			movespeed += accel;
		else if (floor(movespeed) == maxmovespeed)
			movespeed = maxmovespeed2;
		
		// animation speed
		if (movespeed < (floor(maxmovespeed2) / 2) && move != 0)
			image_speed = 0.35;
		else if (movespeed > (floor(maxmovespeed2) / 2) && movespeed < maxmovespeed2)
			image_speed = 0.45;
		else
			image_speed = 0.6;
		
		// decide on a walking sprite
		if (!machslideAnim && !landAnim && !shotgunAnim)
		{
			machslideAnim = false;
			idle = 0;
			facehurt = false;
			
			if (shoot or pistol)
				sprite_index = spr_pistolwalk;
			else if (mort)
				sprite_index = spr_player_mortwalk;
			else if (breakdance_pressed >= breakdance_max)
				sprite_index = spr_breakdance;
			else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
				sprite_index = spr_hurtwalk;
			else if (global.heatmeter && global.stylethreshold == 2)
				sprite_index = spr_3hpwalk;
			else if (global.heatmeter && global.stylethreshold >= 3)
				sprite_index = spr_ragemove;
			else if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss)
			|| (global.noisejetpack && (character != "N" || noisepizzapepper)))
				sprite_index = spr_3hpwalk;
			else if (global.combo >= 50 || (character != "N" && instance_exists(obj_pizzaface_thunderdark)))
				sprite_index = spr_ragemove;
			else
				sprite_index = movespr;
		}
		if (scr_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y) && xscale == move && !check_slope(x, y + 1))
			movespeed = 0;
		
		// stepping particle
		if (move != 0 && grounded && vsp > 0)
		{
			if (steppybuffer > 0)
				steppybuffer--;
			else if (sprite_index != spr_breakdance && sprite_index != spr_pepdance && sprite_index != spr_noise_vulnerable2)
			{
				create_particle(x, y + 43, part.cloudeffect, 0);
				steppybuffer = 12;
				
				// sound
				if IT_final_sounds()
				{
					if place_meeting(x, y, obj_poodebris) && character != "V"
						sound_play_3d("event:/sfx/pep/stepinshit", x, y);
					else
						sound_play_3d(stepsnd, x, y);
				}
			}
		}
	}
	
	// standing still
	else
	{
		steppybuffer = 12;
		if (sprite_index == spr_breakdance)
			image_speed = breakdance_speed;
		else
			image_speed = 0.35;
		
		movespeed = 0;
		if (!machslideAnim && !landAnim && !shotgunAnim && sprite_index != spr_playerV_revolverend)
		{
			// random idle timer
			if (idle < 400 && breakdance_pressed < breakdance_max)
				idle++;
			if (idle >= 150 && breakdance_pressed < breakdance_max)
			{
				if (sprite_index != idlespr && floor(image_index) == (image_number - 1))
				{
					facehurt = false;
					idle = 0;
				}
				if ((!global.pistol || character == "N") && !shotgunAnim && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6 && sprite_index != spr_player_keydoor)
				{
					idleanim = random_range(0, 100);
					if (irandom(100) <= 25)
						sound_play_3d(snd_voicemyea, x, y);
					image_index = 0;
					sprite_index = choose(spr_idle1, spr_idle2, spr_idle3, spr_idle4, spr_idle5, spr_idle6);
				}
			}
			
			// decide on idling sprite
			else if (!facehurt)
			{
				if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
				{
					start_running = true;
					movespeed = 0;
					if (shoot or pistol)
						sprite_index = spr_player_pistolidle;
					else if (mort)
						sprite_index = spr_player_mortidle;
					else if (breakdance_pressed >= breakdance_max)
						sprite_index = spr_breakdance;
					else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_hurtidle;
					else if (PANIC && global.fill <= global.maxwave)
						sprite_index = spr_panic;
					else if (global.heatmeter && global.stylethreshold == 2)
						sprite_index = spr_3hpidle;
					else if (global.heatmeter && global.stylethreshold >= 3)
						sprite_index = spr_rageidle;
					else if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss)
					|| (global.noisejetpack && (character != "N" || noisepizzapepper)))
						sprite_index = spr_3hpidle;
					else if (global.combo >= 50 || (character != "N" && instance_exists(obj_pizzaface_thunderdark)))
						sprite_index = spr_rageidle;
					else
						sprite_index = idlespr;
				}
				else
				{
					idle = 0;
					windingAnim--;
					sprite_index = spr_winding;
					if (breakdance_pressed >= breakdance_max)
						sprite_index = spr_breakdance;
				}
			}
			else
			{
				windingAnim = 0;
				sprite_index = spr_facehurt;
				if (breakdance_pressed >= breakdance_max)
					sprite_index = spr_breakdance;
			}
		}
	}
	
	// decelerate if going too fast
	if (movespeed > maxmovespeed)
		movespeed -= deccel;
	
	// handle landing animation
	if (landAnim)
	{
		if (sprite_index == spr_player_mortland)
		{
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = false;
				sprite_index = spr_player_mortidle;
				image_index = 0;
			}
		}
		else if (sprite_index == spr_player_pistolland)
		{
			if (floor(image_index) == (image_number - 1))
			{
				sprite_index = idlespr;
				landAnim = false;
			}
		}
		else if (!shotgunAnim)
		{
			if (move == 0)
			{
				movespeed = 0;
				sprite_index = spr_land;
				if (floor(image_index) == (image_number - 1))
					landAnim = false;
			}
			else
			{
				sprite_index = spr_land2;
				if (floor(image_index) == (image_number - 1))
				{
					landAnim = false;
					sprite_index = movespr;
					image_index = 0;
				}
			}
		}
		else
		{
			sprite_index = spr_shotgunland;
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = false;
				sprite_index = spr_shotgunidle;
				if (move != 0)
					sprite_index = spr_shotgunwalk;
				image_index = 0;
			}
		}
	}
	else if (shotgunAnim && sprite_index != spr_shotgunshoot && !machslideAnim)
		sprite_index = (move == 0) ? spr_shotgunidle : spr_shotgunwalk;
	
	if (machslideAnim)
		sprite_index = spr_machslideend;
	if (floor(image_index) == (image_number - 1))
	{
		switch (sprite_index)
		{
			case spr_machslideend:
				machslideAnim = false;
				sprite_index = idlespr;
				if (shotgunAnim)
					sprite_index = spr_shotgunidle;
				break;
			case spr_playerV_revolverend:
				sprite_index = idlespr;
				break;
			case spr_shotgunshoot:
				sprite_index = spr_shotgunidle;
				break;
			case spr_pistolshot:
				sprite_index = idlespr;
				break;
		}
	}
	
	if (grounded)
	{
		// jumping
		if ((key_jump || (input_buffer_jump > 0 && (!key_attack or character == "S") && vsp > 0)) && !key_down)
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			if (sprite_index != spr_shotgunshoot)
			{
				sprite_index = spr_jump;
				if (shotgunAnim)
					sprite_index = spr_shotgunjump;
				else if (global.pistol && character != "N")
					sprite_index = spr_player_pistoljump1;
				image_index = 0;
			}
			particle_set_scale(part.highjumpcloud2, xscale, 1);
			create_particle(x, y, part.highjumpcloud2, 0);
			vsp = jumpspeed;
			state = states.jump;
			jumpAnim = true;
			jumpstop = false;
			if (place_meeting(x, y + 1, obj_railparent))
				railmomentum = true; // unused.
			freefallstart = 0;
		}
		
		// crouching
		if (key_down || (grounded && vsp > 0 && scr_solid(x, y - 3)) || check_solid(x, y))
		&& character != "S"
		{
			state = states.crouch;
			landAnim = false;
			crouchAnim = true;
			image_index = 0;
			idle = 0;
		}
	}
	
	// falling
	else if (!key_jump)
	{
		if (sprite_index != spr_shotgunshoot)
		{
			if (!shotgunAnim)
				sprite_index = spr_fall;
			else
				sprite_index = spr_shotgunfall;
			if (global.pistol && character != "N")
				sprite_index = spr_player_pistoljump2;
			image_index = 0;
			jumpAnim = false;
		}
		else
			jumpAnim = true;
		state = states.jump;
	}
	
	if character == "MS" && scr_slapbuffercheck()
		scr_stick_doattack();
	
	if character != "V" && character != "S" && character != "MS"
	{
		if (input_buffer_shoot > 0 && shotgunAnim)
			scr_shotgunshoot();
		else if (input_buffer_pistol > 0 && global.pistol)
		or (global.shootstyle == SHOOT_STYLES.pistol && key_shoot2)
			scr_pistolshoot(states.normal);
		else if key_shoot2
			scr_perform_move(MOD_MOVES.shootattack, states.normal);
		
		var _pistol = (global.pistol && character != "N");
		
		// suplex dash
		var allow_uppercut = IT_allow_uppercut();
		if (input_buffer_grab > 0 && (!key_up or !allow_uppercut) && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol)) && (!SUGARY_SPIRE or !suplexmove or character != "SP"))
		{
			input_buffer_grab = 0;
			input_buffer_slap = 0;
			
			sprite_index = shotgunAnim ? spr_shotgunsuplexdash : spr_suplexdash;
			suplexmove = true;
			fmod_event_instance_play(suplexdashsnd);
			state = states.handstandjump;
			movespeed = suplexspeed;
			image_index = 0;
			
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
		
		// uppercut
		else if allow_uppercut && ((input_buffer_slap > 0 or input_buffer_grab > 0) && key_up && ((shotgunAnim == false && !_pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !_pistol)))
		{
			state = states.punch;
			input_buffer_slap = 0;
			input_buffer_grab = 0;
			image_index = 0;
			sprite_index = spr_breakdanceuppercut;
			fmod_event_instance_play(snd_uppercut);
			
			if character == "V"
				vsp = vigi_uppercut_vsp();
			else if character == "N"
				vsp = -20;
			else
				vsp = -14;
			
			movespeed = hsp;
			if global.banquet && key_attack // high jump going left
				movespeed = abs(hsp);
			
			if SUGARY_SPIRE && character == "SP"
			{
				with instance_create(x, y + 3, obj_highjumpcloud2)
					sprite_index = spr_player_firemouthjumpdust;
			}
			else
			{
				particle_set_scale(part.highjumpcloud2, xscale, 1);
				create_particle(x, y, part.highjumpcloud2, 0);
			}
			
			if (character == "N")
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
		else if input_buffer_slap > 0 && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol))
		{
			input_buffer_slap = 0;
			scr_perform_move(MOD_MOVES.grabattack, states.normal);
		}
	}
	
	// character specifics (and mach)
	switch (character)
	{
		default:
			if !CHAR_POGONOISE
			{
				// peppino
				if (key_attack && state != states.handstandjump && !check_solid(x + xscale, y) && (!place_meeting(x, y + 1, obj_iceblockslope) or !check_solid(x + (xscale * 5), y)) && !global.kungfu)
				{
					if !global.pistol || pistolanim == -4
					{
						sprite_index = spr_mach1;
						image_index = 0;
						
						if global.banquet
							movespeed = abs(movespeed);
						
						if !IT_mach1_state()
						{
							state = states.mach2;
							movespeed = max(movespeed, 6);
						}
						else
						{
							state = states.mach1;
							movespeed = 6;
						}
					}
				}
				
				if (global.kungfu && key_attack && state != states.handstandjump)
				{
					state = states.blockstance;
					sprite_index = spr_player_airattack;
					hsp = 0;
					movespeed = 0;
				}
				
				/*
				if sprite_index == spr_playerN_jetpackboost
					vsp = 0;
				*/
			}
			else
			{
				// pogo noise
				if (pogochargeactive or pizzapepper > 0)
				{
					if (key_attack2)
					{
						sound_play_3d(sfx_woag, x, y)
						state = states.Sjumpprep;
						image_index = 0;
						sprite_index = !key_up ? spr_playerN_jetpackstart : spr_superjumpprep;
						jetpackcancel = true;
						if sprite_index == spr_playerN_jetpackstart && REMIX
							sound_play_3d(sfx_jetpackstart, x, y);
						hsp = 0;
						vsp = 0;
					}
				}
				else if (key_attack && state == states.normal)
				{
					sprite_index = spr_playerN_pogostart;
					image_index = 0;
					state = states.pogo;
				}
			}
			
			if character == "V"
			{
				scr_vigi_throw();
				scr_vigi_shoot();
			}
			break;
		case "S":
			break;
	}
	scr_dotaunt();
	if (sprite_index == spr_shotgunshoot)
	{
		landAnim = false;
		machslideAnim = false;
		image_speed = 0.45;
	}
}
#region PEPPERMAN

function state_pepperman_normal()
{
	pepperman_grab_reset();
	move = key_left + key_right;
	if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel;
	else if (move != 0 && move != sign(xscale) && movespeed > 0)
		movespeed -= pepperman_deccel;
	else if (move == 0)
		movespeed -= pepperman_deccel;
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal;
	if (movespeed > pepperman_maxhsp_normal)
		movespeed -= 0.3;
	else if (movespeed < 0)
		movespeed = 0;
	if (move != 0 && movespeed == 0)
		xscale = move;
	hsp = xscale * movespeed;
	if (sprite_index != spr_pepperman_throw)
	{
		if (hsp != 0)
			sprite_index = spr_move;
		else
			sprite_index = spr_idle;
	}
	if ((input_buffer_jump > 0 || key_jump) && can_jump)
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		sprite_index = spr_jump;
		image_index = 0;
		vsp = -pepperman_jumpspeed;
		state = states.jump;
		with (instance_create(x, y - 5, obj_highjumpcloud2))
			copy_player_scale(other);
	}
	if (!grounded && !key_jump)
	{
		state = states.jump;
		sprite_index = spr_fall;
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
		sprite_index = spr_pepperman_idle;
	if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
	{
		create_particle(x, y + 38, part.cloudeffect);
		steppy = true;
	}
	if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
		steppy = false;
}
function pepperman_grab_reset()
{
	if (pepperman_grabID != noone)
	{
		if (!instance_exists(pepperman_grabID))
			pepperman_grabID = noone;
	}
}

#endregion
function state_snick_normal()
{
	if live_call() return live_result;
	
	static walljump_buffer = 0;
	static dropdash_time = -1;
	
	var acc = 6 * 0.046875;
	var dec = 2 * 0.5;
	var frc = 5 * 0.046875;
	var top = 16;
	var roll_frc = 4 * 0.0234375;
	var roll_dec = 4 * 0.125;
	
	var move = key_left + key_right;
	hsp = movespeed;
	
	if walljump_buffer > 0
		walljump_buffer--;
	
	switch substate
	{
		case states.machslide:
			if sprite_index == spr_machslide
			{
				if abs(movespeed) <= 2
				{
					sprite_index = spr_machslideend;
					image_index = 0;
				}
			}
			else if image_index >= image_number - 1
			or (sprite_index == spr_mach3boostfall && grounded)
			{
				if sprite_index == spr_machslidestart
					sprite_index = spr_machslide;
				else if sprite_index == spr_machslideend
					substate = states.normal;
				else
				{
					if !grounded
						sprite_index = spr_mach3boostfall;
					else
					{
						if move == 0
						{
							sound_play_3d("event:/sfx/pep/break", x, y);
							image_index = 0;
							sprite_index = spr_machslidestart;
							image_speed = 0.5;
						}
						else
							substate = states.normal;
				
						xscale = -xscale;
						movespeed = xscale * top;
					}
				}
			}
			movespeed = Approach(movespeed, 0, 0.5);
			break;
		
		case states.normal:
			if grounded
			{
				// slope momentum
				with check_slope(x, y + 1, true)
					other.movespeed += (other.state == states.machroll ? 0.25 : 0.1) * -sign(image_xscale);
			}
	
			if sprite_index != spr_walljumpstart
			{
				if state != states.machroll
				{
					if move == -1
					{
						if movespeed > 0
						{
							movespeed -= dec;
							if movespeed <= 0
								movespeed = -0.5;
						}
						else if movespeed > -top
						{
							movespeed -= acc;
							if movespeed <= -top
								movespeed = -top;
						}
					}
	
					if move == 1
					{
						if movespeed < 0
						{
							movespeed += dec;
							if movespeed >= 0
								movespeed = 0.5;
						}
						else if movespeed < top
						{
							movespeed += acc;
							if movespeed >= top
								movespeed = top;
						}
					}
	
					if move == 0 && grounded
					    movespeed -= min(abs(movespeed), frc) * sign(movespeed);
				}
				else
					movespeed -= min(abs(movespeed), (move == -sign(movespeed) && !check_slope(x, y + 1)) ? roll_dec : roll_frc) * sign(movespeed);
			}
			else
			{
				if move == -xscale
					 movespeed -= min(abs(movespeed), acc) * sign(movespeed);
			}
			
			// animation
			if state == states.jump
			{
				if sprite_index == spr_fall or sprite_index == spr_move or sprite_index == spr_idle or sprite_index == spr_mach
					sprite_index = spr_fall;
				if move != 0 && sprite_index != spr_walljumpstart
					xscale = sign(move);
				
				if !jumpstop
				{
					if !key_jump2 && vsp < 0.5 && !stompAnim
					{
						vsp /= 3;
						jumpstop = true;
					}
					else if scr_solid(x, y - 1) && !jumpAnim
					{
						vsp = grav;
						jumpstop = true;
					}
				}
				
				if key_jump && dropdash_time == -1
					dropdash_time = 0;
				if !key_jump2
					dropdash_time = -1;
				else if dropdash_time > -1 && dropdash_time < 24 && vsp >= 0
				{
					dropdash_time++;
					if dropdash_time == 8
					{
						sound_play_3d("event:/modded/sfx/snick/dropdash", x, y);
						flash = true;
					}
				}
				
				if dropdash_time >= 8
				{
					sprite_index = spr_tumble;
					with create_blur_afterimage(x, y, sprite_index, image_index, xscale)
						playerid = other.id;
				}
				else if sprite_index == spr_tumble
					sprite_index = spr_snick_roll;
				
				if grounded && vsp >= 0
				{
					if dropdash_time >= 8
					{
						input_buffer_jump = 0;
						
						movespeed = xscale * max(lerp(8, 24, (dropdash_time - 8) / (24 - 8)), abs(movespeed));
						state = states.machroll;
						sprite_index = spr_tumble;
						
						with obj_camera
							lag = 8;
						dropdash_time = -1;
						
						sound_play_3d("event:/modded/sfx/snick/release", x, y);
						with instance_create(x, y, obj_superdashcloud)
							copy_player_scale(other);
					}
					else
					{
						state = states.normal;
						sound_play_3d(landsnd, x, y);
						create_particle(x, y, part.landcloud, 0);
					}
				}
				
				if (key_slap2 or key_chainsaw2) && !suplexmove
				{
					if move == 0
						move = xscale;
					if move != 0
					{
						suplexmove = true;
						input_buffer_jump = 0;
						
						sound_play_3d("event:/modded/sfx/kungfu", x, y);
						vsp = min(vsp, -3);
						movespeed = max(abs(movespeed) + 2, 14) * move;
						sprite_index = spr_walljumpstart;
						image_speed = 0.5;
					}
				}
				
				if walljump_buffer <= 0 && (move == -xscale or abs(movespeed) < 8) && sprite_index == spr_walljumpstart
				{
					sound_play_3d("event:/sfx/pep/grabcancel", x, y);
					sprite_index = spr_suplexcancel;
					image_index = 0;
					
					if move == -xscale
					{
						movespeed /= 2;
						vsp = min(vsp, 0);
					}
				}
			}
			else if state == states.machroll
			{
				sprite_index = spr_tumble;
				if abs(movespeed) <= 0 && !scr_slope()
					state = states.normal;
			}
			else
			{
				dropdash_time = -1;
				if !grounded
					state = states.jump;
		
				if abs(movespeed) > 0
				{
					if move != xscale && move != 0 && (abs(movespeed) > 3 or sprite_index == spr_machslide)
					{
						/*
						if abs(movespeed) >= top - 2
						{
							substate = states.machslide;
							sound_play_3d(sfx_machslideboost, x, y);
							image_index = 0;
							sprite_index = spr_mach3boost;
							image_speed = 0.35;
						}
						else
						*/
						{
							if sprite_index != spr_machslide
							{
								sound_play_3d("event:/sfx/pep/break", x, y);
								image_index = 0;
							}
							sprite_index = spr_machslide;
							image_speed = 0.5;
						}
					}
					else if abs(movespeed) >= top
					{
						if abs(movespeed) >= 20
							sprite_index = spr_crazyrun;
						else
							sprite_index = spr_mach4;
						image_speed = 0.5;
				
						if scr_check_superjump() && grounded
						{
							sprite_index = spr_superjumpprep;
							state = states.Sjumpprep;
							image_index = 0;
					
							dir = move;
							movespeed = abs(movespeed);
						}
				
						if !instance_exists(chargeeffectid)
						{
							with instance_create(x, y, obj_chargeeffect)
							{
								playerid = other.object_index;
								other.chargeeffectid = id;
							}
						}
					}
					else if abs(movespeed) >= top / 2 && move == xscale
					{
						sprite_index = spr_mach;
						image_speed = max(0.2, abs(movespeed) / 30);
					}
					else
					{
						sprite_index = spr_move;
						image_speed = max(0.2, abs(movespeed) / 20);
					}
			
					if move == sign(movespeed)
						xscale = sign(movespeed);
				}
				else
					sprite_index = spr_idle;
			}
	
			if abs(movespeed) > 8 && key_down && grounded && state != states.machroll && !place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_boxofpizza)
			{
				/*
				sound_play_3d("event:/modded/sfx/snick/roll", x, y);
				
				state = states.machroll;
				sprite_index = spr_tumble;
				*/
				
				substate = states.tumble;
				sprite_index = spr_machroll;
			}
			image_speed = max(image_speed, 0.35);
			
			// peelout
			if key_attack && state == states.normal && abs(movespeed) < 8
			{
				// peelout
				if move != 0
					xscale = sign(move);
		
				if !check_solid(x + xscale, y) or place_meeting(x + xscale, y, obj_destructibles) or place_meeting(x + xscale, y, obj_metalblock) or place_meeting(x + xscale, y, obj_ratblock)
				{
					sound_play_3d("event:/modded/sfx/snick/peelrev", x, y);
					state = states.machroll;
					sprite_index = spr_move;
					image_speed = 0.35;
					movespeed = 0;
				}
			}
			
			// spindash with X
			if input_buffer_grab > 0 or input_buffer_slap > 0
			{
				if grounded && abs(movespeed) < 10
				{
					state = states.machroll;
					sprite_index = spr_snick_spindash;
					image_speed = 0.5;
					movespeed = 0;
					
					fmod_event_instance_set_parameter(spindashsnd, "state", 0, true);
					sound_instance_move(spindashsnd, x, y);
					fmod_event_instance_play(spindashsnd);
				}
			}
			
			// jump
			if input_buffer_jump > 0 && can_jump
			{
				input_buffer_jump = 0;
		
				if key_down && state != states.machroll
				{
					// spindash
					if move != 0
						xscale = sign(move);
			
					state = states.machroll;
					sprite_index = spr_snick_spindash;
					image_speed = 0.5;
					movespeed = 0;
			
					fmod_event_instance_set_parameter(spindashsnd, "state", 0, true);
					sound_instance_move(spindashsnd, x, y);
					fmod_event_instance_play(spindashsnd);
				}
				else
				{
					scr_fmod_soundeffect(jumpsnd, x, y);
					particle_set_scale(part.highjumpcloud2, xscale, 1);
					create_particle(x, y, part.highjumpcloud2, 0);
			
					sprite_index = spr_snick_roll;
					state = states.jump;
					vsp = -12;
					jumpstop = false;
					
					with check_slope(x, y + 1, true)
					{
						if other.xscale == image_xscale
							other.vsp -= abs(other.movespeed) / 2;
					}
				}
			}
	
			// bodyslam
			if !grounded && scr_check_groundpound()
			{
				if abs(movespeed) > 12
				{
					sprite_index = spr_dive;
					substate = states.tumble;
					vsp = 10;
					xscale = sign(movespeed);
					
					sound_play_3d(sfx_dive, x, y);
				}
				else
				{
					sprite_index = spr_bodyslamstart;
					image_index = 0;
					state = states.freefall;
					pistolanim = noone;
					vsp = -6;
					dir = sign(movespeed);
					movespeed = abs(movespeed);
				}
			}
	
			// climbwall
			if (((abs(movespeed) > 12 / (scr_slope() + 1) && sign(movespeed) == xscale) or sprite_index == spr_walljumpstart) && !key_down && (move == xscale or walljump_buffer > 0) && dropdash_time < 4)
			&& ((!grounded && (check_solid(x + movespeed, y) || scr_solid_slope(x + movespeed, y)) && !place_meeting(x + movespeed, y, obj_destructibles) && (!place_meeting(x + movespeed, y, obj_metalblock) or abs(movespeed) < 16))
			|| (grounded && (check_solid(x + movespeed, y - 16) || scr_solid_slope(x + movespeed, y - 16)) && !place_meeting(x + movespeed, y, obj_destructibles) && !place_meeting(x + movespeed, y, obj_metalblock) && check_slope(x, y + 1)))
			{
				walljump_buffer = 8;
				
				input_buffer_jump = 0;
				wallspeed = abs(movespeed);
				grabclimbbuffer = 10;
				state = states.climbwall;
				if REMIX
					vsp = -wallspeed;
			}
	
			// bump on wall
			else if (check_solid(x + movespeed, y) or scr_solid_slope(x + movespeed, y))
			&& (!place_meeting(x + movespeed, y, obj_destructibles) or abs(movespeed) < 10)
			&& (!place_meeting(x + movespeed, y, obj_ratblock) or place_meeting(x + movespeed, y, obj_rattumble) or abs(movespeed) < 12)
			&& (!place_meeting(x + movespeed, y, obj_metalblock) or abs(movespeed) < 16)
			{
				var _bump = ledge_bump(vsp >= 0 ? 32 : 22);
				if _bump
				{
					if sprite_index == spr_walljumpstart
					{
						sound_play_3d(sfx_bumpwall, x, y);
						movespeed = 0;
						image_index = 0;
						state = states.bump;
						hsp = xscale * -3;
						vsp = -4;
						substate = states.normal;
					}
					else
					{
						movespeed = 0;
						hsp = 0;
					}
				}
			}
	
			scr_dotaunt();
			break;
		
		case states.tumble: // DIVE
			state = states.normal;
			if !grounded
			{
				vsp = max(vsp, 10);
				sprite_index = spr_dive;
				
				if key_jump && key_down
				{
					sprite_index = spr_poundcancel1;
					image_index = 0;
					state = states.freefall;
					substate = states.normal;
					dir = sign(movespeed);
					movespeed = abs(movespeed);
					vsp = -6;
				}
			}
			else
				sprite_index = spr_machroll;
			
			if !key_down && grounded
				substate = states.normal;
			if check_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_unbumpablewall) && !place_meeting(x + xscale, y, obj_destructibles)
			{
				sound_play_3d(sfx_bumpwall, x, y);
				movespeed = 0;
				image_index = 0;
				state = states.bump;
				hsp = xscale * -3;
				vsp = -4;
				substate = states.normal;
			}
			break;
	}
}
function scr_player_normal()
{
	//if live_call() return live_result;
	
	if character == "S"
		state_snick_normal();
	else if (character != "M")
		state_player_normal();
	else
		state_pepperman_normal();
}
