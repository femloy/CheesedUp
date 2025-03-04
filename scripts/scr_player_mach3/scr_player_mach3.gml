function scr_player_mach3()
{
	if (sprite_index == spr_fightball)
	{
		scr_player_fightball();
		exit;
	}
	
	var slopeaccel = 0.1;
	var slopedeccel = 0.2;
	var mach4movespeed = IT_mach3_mach4speed();
	var mach3movespeed = IT_mach3_mach3speed();
	var accel = IT_mach3_accel();
	var mach4accel = 0.1;
	var jumpspeed = IT_jumpspeed();
	var machrollspeed = 10;
	
	#region PEPPINO / VIGI
	
	var mach3_spr = spr_mach4;
	if !jetpackcancel
	{
		if character == "V"
		{
			if collision_line(x, y, x + 300 * xscale, y, obj_metalblock, 0, 0)
			{
				spr_mach4 = spr_playerV_mach3dynamite;
				spr_crazyrun = spr_playerV_mach4dynamite;
				
				if sprite_index == spr_playerV_mach3
					sprite_index = spr_mach4;
				if sprite_index == spr_playerV_crazyrun
					sprite_index = spr_crazyrun;
			}
			else
			{
				spr_mach4 = spr_playerV_mach3;
				spr_crazyrun = spr_playerV_crazyrun;
				
				if sprite_index == spr_playerV_mach3dynamite
					sprite_index = spr_mach4;
				if sprite_index == spr_playerV_mach4dynamite
					sprite_index = spr_crazyrun;
			}
		}
		
		if (global.swapmode && key_attack && key_fightball && !instance_exists(obj_swapmodegrab) && !instance_exists(obj_swapdeatheffect) && !instance_exists(obj_noiseanimatroniceffect) && obj_swapmodefollow.animatronic <= 0)
		{
			sprite_index = spr_fightball;
			jump_p2 = false;
			if (noisecrusher)
				instance_create_unique(x, y, obj_swapgusfightball);
			exit;
		}
		if (character == "N" && grounded && vsp > 0)
		{
			if (sprite_index == spr_mach4 && place_meeting(x, y + 1, obj_water))
				sprite_index = spr_playerN_mach3water;
			else if (sprite_index == spr_playerN_mach3water && !place_meeting(x, y + 1, obj_water))
				sprite_index = spr_mach4;
		}
		
		if (windingAnim < 2000)
			windingAnim++;
		if (place_meeting(x, y + 1, obj_railparent))
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			railmovespeed = _railinst.movespeed;
			raildir = _railinst.dir;
		}
		hsp = (xscale * movespeed) + (railmovespeed * raildir);
		
		if (grounded && sprite_index == spr_playerN_skateboarddoublejump)
		{
			sprite_index = mach3_spr;
			sound_play_3d("event:/sfx/playerN/wallbounceland", x, y);
		}
		
		move = key_right + key_left;
		if ceilingrun && move != 0
			move = xscale;
		
		if (grounded && IT_slope_momentum())
		{
			if ((scr_slope() && hsp != 0) && movespeed > 10 && movespeed < 18)
				scr_player_addslopemomentum(slopeaccel, slopedeccel);
		}
		
		if (move == xscale && (grounded or IT_mach3_old_acceleration()))
		{
			if (movespeed < mach4movespeed)
			{
				if (!mach4mode)
					movespeed += accel;
				else
					movespeed += mach4accel;
				
				// old particles
				if IT_april_particles() && grounded && !instance_exists(crazyruneffectid)
				{
					with instance_create(x, y, obj_crazyruneffect)
	                {
	                    playerid = other.object_index;
	                    other.crazyruneffectid = id;
	                }
					if mach4mode
					{
						with instance_create(x, y, obj_dashcloud)
		                {
		                    image_xscale = other.xscale;
		                    sprite_index = spr_flamecloud;
		                }
					}
				}
			}
		}
		else if IT_mach3_old_acceleration()
			movespeed = Approach(movespeed, 12, 0.1);
		
		mach2 = 100;
		momemtum = true;
		
		if (fightball == 1 && global.coop == 1)
		{
			if (object_index == obj_player1)
			{
				x = obj_player2.x;
				y = obj_player2.y;
			}
			if (object_index == obj_player2)
			{
				x = obj_player1.x;
				y = obj_player1.y;
			}
		}
		if (sprite_index == spr_crazyrun)
		{
			if (flamecloud_buffer > 0)
				flamecloud_buffer--;
			else
			{
				flamecloud_buffer = 10;
				with (instance_create(x, y, obj_dashcloud))
				{
					copy_player_scale(other);
					sprite_index = spr_flamecloud;
				}
			}
		}
		crouchslideAnim = true;
		if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
		{
			vsp /= 20;
			jumpstop = true;
		}
		if (grounded && vsp > 0)
			jumpstop = false;
		if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			if (sprite_index != spr_fightball)
			{
				image_index = 0;
				sprite_index = spr_mach3jump;
			}
			vsp = jumpspeed;
		}
		
		if (input_buffer_jump > 0 && !can_jump && key_up && CHAR_BASENOISE && noisedoublejump)
			scr_player_do_noisecrusher();
		
		if (fightball == 0)
		{
			if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
				sprite_index = mach3_spr;
			if (sprite_index == spr_Sjumpcancel && grounded)
				sprite_index = mach3_spr;
			if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach || sprite_index == spr_player_pistolshot))
				sprite_index = mach3_spr;
			if (sprite_index == spr_mach2jump && grounded && vsp > 0)
				sprite_index = mach3_spr;
			if (sprite_index == spr_playerN_sidewayspin && floor(image_index) == (image_number - 1))
				sprite_index = spr_playerN_sidewayspinend;
			if (grounded && (sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend))
				sprite_index = mach3_spr;
			
			if (movespeed > mach3movespeed && sprite_index != spr_crazyrun && sprite_index != spr_Sjumpcancelstart && sprite_index != spr_taunt)
			{
				mach4mode = true;
				flash = true;
				sprite_index = spr_crazyrun;
			}
			else if (movespeed <= mach3movespeed && sprite_index == spr_crazyrun)
				sprite_index = mach3_spr;
				
			// bo noise funky grind rails
			/*
			if BO_NOISE
			{
				if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerBN_grindJump)
					sprite_index = spr_playerBN_grindFall;
				if (sprite_index == spr_playerBN_grindFall && grounded && vsp > 0)
					sprite_index = mach3_spr;
			}
			*/
		}
		if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
		{
			with (instance_create(x, y, obj_crazyrunothereffect))
			{
				playerid = other.object_index;
				other.crazyruneffectid = id;
			}
		}
		
		if (sprite_index == mach3_spr || sprite_index == spr_fightball)
			image_speed = 0.4;
		else if (sprite_index == spr_crazyrun)
			image_speed = 0.75;
		else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
			image_speed = 0.4;
		
		if (!key_attack && fightball == 0 && !launched) && sprite_index != spr_dashpadmach && grounded && vsp > 0
		{
			sprite_index = spr_machslidestart;
			sound_play_3d(breaksnd, x, y);
			state = states.machslide;
			image_index = 0;
			launched = false;
		}
		if (move == -xscale && grounded && vsp > 0 && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
		{
			sound_play_3d(machslidesnd, x, y);
			sprite_index = spr_mach3boost;
			state = states.machslide;
			image_index = 0;
		}
		if scr_mach_check_dive() && !fightball && sprite_index != spr_dashpadmach
		{
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
			flash = false;
			state = states.tumble;
			vsp = machrollspeed;
			
			if !IT_old_machroll()
			{
				image_index = 0;
				if !grounded
					sprite_index = spr_mach2jump;
				else
					sprite_index = spr_machroll;
			}
			else
			{
				state = states.machroll;
				if character == "V"
					sprite_index = spr_playerV_divekickstart;
			}
		}
		
		if ((!grounded && (check_solid(x + hsp, y) || scr_solid_slope(x + hsp, y)) && !check_slope(x, y - 1))
		|| (grounded && (check_solid(x + sign(hsp), y - 16) || scr_solid_slope(x + sign(hsp), y - 16)) && check_slope(x, y + 1)))
		&& scr_preventbump(states.mach3)
		{
			var _climb = true;
			if CHAR_BASENOISE
				_climb = ledge_bump(40, abs(hsp) + 1);
			
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
				
				wallspeed = IT_mach3_climbwall_speed();
				grabclimbbuffer = 0;
				
				if IT_climbwall_transfer_speed() && movespeed >= 1
					movespeed = wallspeed;
				
				state = states.climbwall;
				
				if REMIX
					vsp = -wallspeed;
			}
		}
		
		/*
		if !grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock)
		{
			var _climb = true;
			if CHAR_BASENOISE
				_climb = ledge_bump(40);
			if _climb
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				state = states.climbwall;
			}
		}
		*/
		
		if character == "MS" && scr_slapbuffercheck()
			scr_stick_doattack();
			
		if IT_mach_grab() && sprite_index != spr_dashpadmach
			scr_player_handle_moves(states.mach3);
		
		if scr_solid(x + sign(hsp), y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y)) && scr_preventbump(states.mach3) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded
		{
			var _bump = true;
			if character != "N" || noisemachcancelbuffer <= 0
				_bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if _bump
			{
				shake_camera(20, 40 / room_speed);
				with (obj_baddie)
				{
					if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
					{
						stun = true;
						alarm[0] = 200;
						ministun = false;
						vsp = -5;
						hsp = 0;
					}
				}
				if (!fightball)
				{
					sprite_index = spr_hitwall;
					sound_play_3d(sfx_groundpound, x, y);
					sound_play_3d(sfx_bumpwall, x, y);
					hsp = 0;
					flash = false;
					state = states.bump;
					hsp = -6 * xscale;
					vsp = -6;
					mach2 = 0;
					image_index = 0;
					instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
				}
				else
				{
					fightball = false;
					with (obj_player)
					{
						sprite_index = spr_hitwall;
						sound_play_3d(sfx_groundpound, x, y);
						sound_play_3d(sfx_bumpwall, x, y);
						hsp = 0;
						flash = false;
						state = states.bump;
						hsp = -6 * xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + 10, y + 10, obj_bumpeffect);
					}
				}
			}
		}
		
		if character == "V"
		{
			scr_vigi_shoot();
			scr_vigi_throw();
		}
		
		if (scr_check_superjump() && fightball == 0 && state == states.mach3 && character != "V" && (grounded or IT_Sjump_midair()) && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
		{
			sprite_index = spr_superjumpprep;
			state = states.Sjumpprep;
			hsp = 0;
			image_index = 0;
			
			if character == "MS"
				state = states.stick_superjump;
		}
	}
	
	#endregion
	#region NOISE JETPACK
	
	else
	{
		hsp = xscale * movespeed;
		move = key_right + key_left;
		if (fightball == 0)
			vsp = 0;
		if (key_up && fightball == 0)
			vsp = -3;
		if (key_down && fightball == 0)
			vsp = 3;
		if (abs(hsp) < mach4movespeed && move == xscale)
		{
			movespeed += 0.075;
			if (!instance_exists(crazyruneffectid) && grounded)
			{
				with (instance_create(x, y, obj_crazyruneffect))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
				if (sprite_index == spr_crazyrun)
				{
					if (flamecloud_buffer > 0)
						flamecloud_buffer--;
					else
					{
						flamecloud_buffer = 220 + irandom_range(1, 180);
						with (instance_create(x, y, obj_dashcloud))
						{
							image_xscale = other.xscale;
							sprite_index = spr_flamecloud;
						}
					}
				}
			}
		}
		else if movespeed > 12 && move != xscale
			movespeed -= 0.1;
		
		if SUGARY_SPIRE && character == "SN"
			sprite_index = grounded ? spr_pizzano_mach3 : spr_pizzano_sjumpside;
		else if movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_Sjumpcancelstart && sprite_index != spr_taunt
		{
			mach4mode = true;
			flash = true;
			sprite_index = spr_crazyrun;
		}
		else if movespeed <= 16
			sprite_index = spr_playerN_jetpackboost;
		
		if (key_jump2 && fightball == 0)
		{
			input_buffer_jump = 0;
			
			scr_fmod_soundeffect(jumpsnd, x, y);
			sound_play_3d("event:/modded/sfx/kungfu", x, y);
			
			dir = xscale;
			momemtum = false;
			jumpstop = false;
			vsp = -15;
			
			if SUGARY_SPIRE && character == "SN"
			{
				// boring ass sugary way
				/*
				state = states.mach2;
				sprite_index = spr_secondjump1;
				image_index = 0;
				*/
				
				// good cheesed up way
				state = states.removed_state;
				sprite_index = movespeed >= 12 ? spr_pizzano_machtwirl : spr_pizzano_twirl;
			}
			else
			{
				state = states.jump;
				sprite_index = spr_playerN_noisebombspinjump;
				image_index = 0;
			}
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust, 0);
		}
		if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad) && grounded)
		{
			flash = false;
			sprite_index = spr_playerN_jetpackslide;
			
			if SUGARY_SPIRE
			{
				if character == "SN"
					sprite_index = spr_pizzano_crouchslide;
			}
		}
		if scr_solid(x + sign(hsp), y) && (!check_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y)) && scr_preventbump(states.mach3) && !place_meeting(x + sign(hsp), y, obj_hungrypillar)
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if _bump
			{
				shake_camera(20, 40 / room_speed);
				with (obj_baddie)
				{
					if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
					{
						stun = true;
						alarm[0] = 200;
						ministun = false;
						vsp = -5;
						hsp = 0;
					}
				}
				sprite_index = spr_hitwall;
				sound_play_3d("event:/sfx/pep/groundpound", x, y);
				sound_play_3d("event:/sfx/pep/bumpwall", x, y);
				hsp = 0;
				flash = false;
				state = states.bump;
				hsp = -6 * xscale;
				vsp = -6;
				mach2 = 0;
				image_index = 0;
				instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
			}
		}
	}
	
	#endregion
	
	var b = false;
	with (obj_hamkuff)
	{
		if (state == states.blockstance && playerid == other.id)
			b = true;
	}
	if (!instance_exists(dashcloudid) && grounded && !b)
	{
		var p = instance_create(x, y, obj_superdashcloud);
		with p
		{
			if (other.fightball == 1)
				instance_create(other.x, other.y, obj_slapstar);
			copy_player_scale(other);
			other.dashcloudid = id;
		}
		if place_meeting(x, y + 1, obj_water)
			p.sprite_index = spr_watereffect;
	}
	scr_dotaunt();
	
	if !instance_exists(chargeeffectid)
	{
		with instance_create(x, y, obj_chargeeffect)
		{
			playerid = other.id;
			other.chargeeffectid = id;
		}
	}
	
	if sprite_index == mach3_spr || sprite_index == spr_fightball
		image_speed = 0.4;
	else if sprite_index == spr_crazyrun
		image_speed = 0.75;
	else if sprite_index == spr_rollgetup || sprite_index == spr_mach3hit
		image_speed = 0.4;
	else
		image_speed = 0.4;
	
	/*
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		image_index = 0;
		state = states.lungeattack;
	}
	*/
}
