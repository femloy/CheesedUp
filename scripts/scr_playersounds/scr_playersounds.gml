function scr_playersounds()
{
	static did_cosmic = false;
	with obj_player1
	{
		var noise_mach = character == "N";
		var noise_sjump = character == "N";
		
		// pizzaface moving
		if (instance_exists(obj_pizzaface))
		{
			if (!fmod_event_instance_is_playing(global.snd_pizzafacemoving))
				fmod_event_instance_play(global.snd_pizzafacemoving);
			with (obj_pizzaface)
				sound_instance_move(global.snd_pizzafacemoving, x, y);
		}
		else
			fmod_event_instance_stop(global.snd_pizzafacemoving, true);
	
		// burp sound after drinking milk
		if (state == states.actor && sprite_index == spr_firemouthend)
		{
			if (image_index > 8 && !fmod_event_instance_is_playing(burpsnd))
			{
				fmod_event_instance_play(burpsnd);
				sound_instance_move(burpsnd, x, y);
			}
		}
	
		// force stop alarm sounds
		if global.snd_alarm_baddieID != -4
		{
			if !instance_exists(global.snd_alarm_baddieID)
			{
				global.snd_alarm_baddieID = -4;
				fmod_event_instance_stop(global.snd_alarm, true);
			}
			else
				sound_instance_move(global.snd_alarm, global.snd_alarm_baddieID.x, global.snd_alarm_baddieID.y);
		}
	
		// transfo / detransfo
		if (state != states.tube && sprite_index != spr_knightpepstart && state != states.bombgrab && state != states.chainsaw && state != states.teleport && state != states.secretenter && state != states.door && state != states.victory && state != states.stunned && state != states.dead && state != states.fireass)
		{
			if (!scr_transformationcheck())
			{
				if (!transformationsnd)
				{
					transformationsnd = true;
					if (irandom(100) <= 70)
						fmod_event_instance_play(snd_voicetransfo);
					sound_play_3d("event:/sfx/misc/transfo", x, y);
				}
			}
			else if (transformationsnd)
			{
				transformationsnd = false;
				if (irandom(100) <= 70)
					fmod_event_instance_play(snd_voiceouttransfo);
				sound_play_3d("event:/sfx/misc/detransfo", x, y);
			}
		}
	
		sound_instance_move(snd_voiceouttransfo, x, y);
		sound_instance_move(snd_voicetransfo, x, y);
		sound_instance_move(snd_voiceok, x, y);
		sound_instance_move(snd_voicehurt, x, y);
		sound_instance_move(snd_uppercut, x, y);
		sound_instance_move(snd_dive, x, y);
		sound_instance_move(snd_crouchslide, x, y);
		sound_instance_move(rollgetupsnd, x, y);
		sound_instance_move(animatronicsnd, x, y);
		sound_instance_move(snd_dashpad, x, y);
		sound_instance_move(gallopingsnd, x, y);
	
		// groundpound start boing sound
		if (state == states.freefall || state == states.freefallprep || (state == states.superslam || (state == states.chainsaw && tauntstoredstate == states.superslam)))
		{
			if (!fmod_event_instance_is_playing(freefallsnd))
				fmod_event_instance_play(freefallsnd);
			fmod_event_instance_set_paused(freefallsnd, false);
			sound_instance_move(freefallsnd, x, y);
		}
		else
			fmod_event_instance_stop(freefallsnd, true);
	
		// mach
		if !noise_mach && (state == states.mach1 or state == states.mach2 || state == states.mach3 || state == states.climbwall || state == states.rocket or (character == "S" && visible))
		{
			if sprite_index == spr_playerN_jetpackboost
			{
				fmod_event_instance_stop(machsnd, true);
				
				if !fmod_event_instance_is_playing(snd_jetpackloop)
					fmod_event_instance_play(snd_jetpackloop);
				sound_instance_move(snd_jetpackloop, x, y);	
			}
			else
			{
				fmod_event_instance_stop(snd_jetpackloop, true);
				
				fmod_event_instance_set_paused(machsnd, false);
				if !fmod_event_instance_is_playing(machsnd)
					fmod_event_instance_play(machsnd);
				
				var s = 0;
				if ((state == states.mach2 or state == states.mach1) && sprite_index == spr_mach1 && grounded)
					s = 1;
				else if ((state == states.mach2 && sprite_index == spr_mach) || state == states.climbwall)
				or (sprite_index == spr_snick_mach2 && grounded)
					s = 2;
				else if (state == states.mach3 && sprite_index != spr_crazyrun)
				or (sprite_index == spr_snick_mach3 && grounded)
					s = 3;
				else if (sprite_index == spr_crazyrun)
					s = 4;
				if state == states.rocket
					s = 4;
				
				sound_instance_move(machsnd, x, y);
				fmod_event_instance_set_parameter(machsnd, "state", s, true);
			}
		}
		else
		{
			fmod_event_instance_stop(machsnd, true);
			fmod_event_instance_stop(snd_jetpackloop, true)
		}
	
		// knightpep/grinding
		if ((state == states.knightpepslopes && grounded && vsp > 0) || state == states.grind || (state == states.trashroll && grounded && vsp > 0 && sprite_index == spr_player_trashslide))
		{
			if (!fmod_event_instance_is_playing(knightslidesnd))
				fmod_event_instance_play(knightslidesnd);
			sound_instance_move(knightslidesnd, x, y);
		}
		else if (fmod_event_instance_is_playing(knightslidesnd))
			fmod_event_instance_stop(knightslidesnd, true);
	
		// superjump
		var sjumpsnd = superjumpsnd;
		if !noise_sjump
		{
			if state == states.Sjumpprep
			{
				if !fmod_event_instance_is_playing(sjumpsnd)
				or ((REMIX or IT_Sjump_mach3_cancel()) && fmod_event_instance_get_parameter(sjumpsnd, "state", true) > 0)
				{
					fmod_event_instance_set_parameter(sjumpsnd, "state", 0, true);
					fmod_event_instance_play(sjumpsnd);
				}
			}
			else if state == states.Sjump
				fmod_event_instance_set_parameter(sjumpsnd, "state", 1, true);
			else if state != states.Sjump
			{
				if (fmod_event_instance_is_playing(sjumpsnd) && fmod_event_instance_get_parameter(sjumpsnd, "state", true) < 1)
					fmod_event_instance_stop(sjumpsnd, true);
				else if (!fmod_event_instance_is_playing(sjumpsnd))
					fmod_event_instance_set_parameter(sjumpsnd, "state", 0, true);
			}
			if sprite_index == spr_Sjumpcancelstart || sprite_index == spr_playerN_sidewayspin
				fmod_event_instance_stop(sjumpsnd, true);
			if fmod_event_instance_is_playing(sjumpsnd)
				sound_instance_move(sjumpsnd, x, y);
		}
		else
			fmod_event_instance_stop(sjumpsnd, true);
	
		// tumble transfo
		if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
		&& (state == states.tumble or character != "S")
		{
			var pretumble = sprite_index == spr_tumblestart && floor(image_index) < 11;
			if !fmod_event_instance_is_playing(tumblesnd)
			{
				fmod_event_instance_set_parameter(tumblesnd, "state", pretumble ? 3 : 0, true);
				fmod_event_instance_play(tumblesnd);
			
				if sprite_index == spr_tumblestart
					tumbleintro = true;
			}
			if sprite_index == spr_tumblestart && !pretumble
				fmod_event_instance_set_parameter(tumblesnd, "state", 0, true);
			if sprite_index == spr_tumble && !tumbleintro
				fmod_event_instance_set_parameter(tumblesnd, "state", 1, true);
			sound_instance_move(tumblesnd, x, y);
		}
		else
		{
			if fmod_event_instance_is_playing(tumblesnd)
			{
				fmod_event_instance_set_parameter(tumblesnd, "state", 2, true);
				sound_instance_move(tumblesnd, x, y);
			}
			tumbleintro = false;
		}
	
		// rolling sound
		if IT_final_sounds()
		{
			if (sprite_index == spr_machroll || sprite_index == spr_backslide || sprite_index == spr_backslideland)
			or sprite_index == spr_buttattackend
			{
				if !fmod_event_instance_is_playing(machrollsnd)
					fmod_event_instance_play(machrollsnd);
				sound_instance_move(machrollsnd, x, y);
			}
			else
				fmod_event_instance_stop(machrollsnd, true);
		}
		else
		{
			if sprite_index == spr_machroll
			{
				fmod_event_instance_set_parameter(tumblesnd, "state", 1, true);
				if !fmod_event_instance_is_playing(tumblesnd)
					fmod_event_instance_play(tumblesnd);
				sound_instance_move(tumblesnd, x, y);
			}
			else if fmod_event_instance_is_playing(tumblesnd) && state != states.tumble && sprite_index != spr_tumbleend
				fmod_event_instance_stop(tumblesnd, true);
		}
	
		// stop grab sound
		if (fmod_event_instance_is_playing(suplexdashsnd))
		{
			if (state != states.handstandjump && state != states.chainsawbump)
				fmod_event_instance_stop(suplexdashsnd, true);
			sound_instance_move(suplexdashsnd, x, y);
		}
	
		// grave corpse surfing
		if (state == states.trashroll && sprite_index == spr_playercorpsesurf && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(gravecorpsesnd))
				fmod_event_instance_play(gravecorpsesnd);
			sound_instance_move(gravecorpsesnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(gravecorpsesnd, true);
	
		// barrel sliding
		if (state == states.barrelslide && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(barrelslidesnd))
				fmod_event_instance_play(barrelslidesnd);
			sound_instance_move(barrelslidesnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(barrelslidesnd, true);
	
		// current sliding
		if (state == states.slipnslide && sprite_index == spr_currentplayer)
		{
			if (!fmod_event_instance_is_playing(waterslidesnd))
				fmod_event_instance_play(waterslidesnd);
			sound_instance_move(waterslidesnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(waterslidesnd, true);
	
		// mr pinch
		if (state == states.stringfall)
		{
			if (!fmod_event_instance_is_playing(mrpinchsnd))
				fmod_event_instance_play(mrpinchsnd);
			fmod_event_instance_set_parameter(mrpinchsnd, "state", 0, true);
			sound_instance_move(mrpinchsnd, x + hsp, y + vsp);
		}
		else if (fmod_event_instance_is_playing(mrpinchsnd))
		{
			fmod_event_instance_set_parameter(mrpinchsnd, "state", 1, true);
			sound_instance_move(mrpinchsnd, x + hsp, y + vsp);
		}
	
		// hamkuff
		if (hamkuffID != noone && instance_exists(hamkuffID) && !launched)
		{
			if (!fmod_event_instance_is_playing(hamkuffsnd))
				fmod_event_instance_play(hamkuffsnd);
			if (launch)
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 1, true);
			else
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 0, true);
			sound_instance_move(hamkuffsnd, x + hsp, y + vsp);
		}
		else
		{
			if (fmod_event_instance_is_playing(hamkuffsnd))
			{
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 2, true);
				sound_instance_move(hamkuffsnd, x + hsp, y + vsp);
			}
			hamkuffID = noone;
		}
	
		// ratmount
		if ((state == states.ratmount || state == states.ratmountjump) && (sprite_index == spr_player_ratmountattack || sprite_index == spr_player_ratmountmach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dash || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_lonegustavo_dashjump))
		{
			if (!fmod_event_instance_is_playing(ratmountmachsnd))
				fmod_event_instance_play(ratmountmachsnd);
			s = 0;
			if (sprite_index == spr_ratmount_mach3 || sprite_index == spr_lonegustavomach3 || sprite_index == spr_ratmount_dashjump || sprite_index == spr_lonegustavodashjump)
				s = 1;
			fmod_event_instance_set_parameter(ratmountmachsnd, "state", s, true);
			if (grounded)
				fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 1, true);
			else
				fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 0, true);
			sound_instance_move(ratmountmachsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(ratmountmachsnd, true);
	
		if (state == states.ratmountpunch)
		{
			if (!fmod_event_instance_is_playing(ratmountpunchsnd))
				fmod_event_instance_play(ratmountpunchsnd);
			sound_instance_move(ratmountpunchsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(ratmountpunchsnd, true);
	
		if (state == states.ratmountbounce && sprite_index == spr_ratmount_walljump)
		{
			if (!fmod_event_instance_is_playing(ratmountgroundpoundsnd))
				fmod_event_instance_play(ratmountgroundpoundsnd);
			s = 0;
			if (instance_exists(superslameffectid))
				s = 1;
			fmod_event_instance_set_parameter(ratmountgroundpoundsnd, "state", s, true);
			sound_instance_move(ratmountgroundpoundsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(ratmountgroundpoundsnd, true);
	
		// animatronic creaking
		if state == states.animatronic && character != "N" && character != "D"
		{
			if !fmod_event_instance_is_playing(animatronicsnd)
				fmod_event_instance_play(animatronicsnd);
			sound_instance_move(animatronicsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(animatronicsnd, true);
	
		// rolling brick ball
		if (instance_exists(obj_brickball) && character != "N")
		{
			if (!fmod_event_instance_is_playing(ratmountballsnd))
				fmod_event_instance_play(ratmountballsnd);
			sound_instance_move(ratmountballsnd, obj_brickball.x + obj_brickball.hsp, obj_brickball.y + obj_brickball.vsp);
		}
		else
			fmod_event_instance_stop(ratmountballsnd, true);
	
		// deflating balloon
		if (instance_exists(obj_balloongrabbableeffect))
		{
			if (!fmod_event_instance_is_playing(ratdeflatesnd))
				fmod_event_instance_play(ratdeflatesnd);
			sound_instance_move(ratdeflatesnd, obj_balloongrabbableeffect.x, obj_balloongrabbableeffect.y);
		}
		else
			fmod_event_instance_stop(ratdeflatesnd, true);
	
		// cheese balled
		if (state == states.cheeseball && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(cheeseballsnd))
				fmod_event_instance_play(cheeseballsnd);
			sound_instance_move(cheeseballsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(cheeseballsnd, true);
	
		// weenie ride
		if (state == states.rideweenie && abs(hsp) > 8 && grounded)
		{
			if (!fmod_event_instance_is_playing(gallopingsnd))
				fmod_event_instance_play(gallopingsnd);
		}
		else if (fmod_event_instance_is_playing(gallopingsnd))
			fmod_event_instance_stop(gallopingsnd, true);
	
		// spinning boxxedpep
		if (state == states.boxxedpepspin)
		{
			if (!fmod_event_instance_is_playing(boxxedspinsnd))
				fmod_event_instance_play(boxxedspinsnd);
			sound_instance_move(boxxedspinsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(boxxedspinsnd, true);
	
		// satans choice flying
		if (fmod_event_instance_is_playing(pizzapeppersnd))
		{
			if (state == states.jetpackjump)
			{
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
				sound_instance_move(pizzapeppersnd, x + hsp, y + vsp);
			}
			else
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 1, true);
		}
	
		// ghost moving
		if (state == states.ghost && sprite_index != spr_ghostidle && sprite_index != spr_ghostjump && (character == "N" || ghostdash))
		{
			if (!fmod_event_instance_is_playing(ghostspeedsnd))
				fmod_event_instance_play(ghostspeedsnd);
			s = 0;
			if (ghostpepper == 1)
				s = 1;
			else if (ghostpepper == 2)
				s = 2;
			else if (ghostpepper >= 3)
				s = 3;
			sound_instance_move(ghostspeedsnd, x, y);
			fmod_event_instance_set_parameter(ghostspeedsnd, "state", s, true);
		}
		else if (fmod_event_instance_is_playing(ghostspeedsnd))
			fmod_event_instance_stop(ghostspeedsnd, false);
		
		// superjump
		if noise_sjump
		{
			if state == states.Sjumpprep
			{
				if (!fmod_event_instance_is_playing(snd_noiseSjump))
					fmod_event_instance_play(snd_noiseSjump)
			}
			else
				fmod_event_instance_stop(snd_noiseSjump, true)
		
			sound_instance_move(snd_noiseSjump, x, y)
			sound_instance_move(snd_noiseSjumprelease, x, y)
		}
		else
			fmod_event_instance_stop(snd_noiseSjump, true)
		
		// noise mach
		if noise_mach
		{
			if state == states.mach1 or state == states.mach2 || state == states.mach3 || state == states.climbwall
			{
				if (!fmod_event_instance_is_playing(snd_noisemach))
					fmod_event_instance_play(snd_noisemach)
				var s = 0;
				if (state == states.mach1 or state == states.mach2 || state == states.climbwall)
					s = 1;
				else if state == states.mach3 && sprite_index != spr_crazyrun
					s = 2;
				else if sprite_index == spr_crazyrun
					s = 3;
				sound_instance_move(snd_noisemach, x, y)
				fmod_event_instance_set_parameter(snd_noisemach, "state", s, true)
				if (grounded || state == states.climbwall)
					fmod_event_instance_set_parameter(snd_noisemach, "ground", 1, true)
				else
					fmod_event_instance_set_parameter(snd_noisemach, "ground", 0, true)
			}
			else
				fmod_event_instance_stop(snd_noisemach, true)
		}
		else
			fmod_event_instance_stop(snd_noisemach, true)
		
		if character == "N"
		{
			// noise minigun
			if (sprite_index == spr_playerN_minigunshoot || sprite_index == spr_playerN_minigundown)
			{
				if (!fmod_event_instance_is_playing(snd_minigun))
					fmod_event_instance_play(snd_minigun)
				sound_instance_move(snd_minigun, x, y)
				fmod_event_instance_set_parameter(snd_minigun, "state", 0, true)
			}
			else if fmod_event_instance_is_playing(snd_minigun)
				fmod_event_instance_set_parameter(snd_minigun, "state", 1, true)
			
			// noise ghost dash
			if (state == states.ghost || (state == states.chainsaw && tauntstoredstate == states.ghost))
			{
				sound_instance_move(snd_ghostdash, x, y)
				fmod_event_instance_set_parameter(snd_ghostdash, "state", min(ghostpepper, 2), true)
			}
			else
				fmod_event_instance_stop(snd_ghostdash, true)
			
			// various noise sounds
			sound_instance_move(snd_noisedoublejump, x, y)
			sound_instance_move(snd_noisepunch, x, y)
			sound_instance_move(snd_bossdeathN, x, y)
			if sprite_index == spr_playerN_sidewayspin
				fmod_event_instance_stop(snd_noiseSjumprelease, true)
		
			// drill and wallbounce
			if (state == states.machcancel || (state == states.chainsaw && tauntstoredstate == states.machcancel))
			{
				if sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombfall && sprite_index != spr_playerN_divebombland
				{
					if fmod_event_instance_is_playing(snd_divebomb)
						fmod_event_instance_stop(snd_divebomb, true)
					if ((!fmod_event_instance_is_playing(snd_wallbounce)) && (!fmod_event_instance_get_paused(snd_wallbounce)))
						fmod_event_instance_play(snd_wallbounce)
					if fmod_event_instance_get_paused(snd_wallbounce)
						fmod_event_instance_set_paused(snd_wallbounce, false)
					sound_instance_move(snd_wallbounce, x, y)
				}
				else
				{
					if fmod_event_instance_is_playing(snd_wallbounce)
						fmod_event_instance_stop(snd_wallbounce, true)
					if (!fmod_event_instance_is_playing(snd_divebomb))
						fmod_event_instance_play(snd_divebomb)
					sound_instance_move(snd_divebomb, x, y)
					if !grounded
						fmod_event_instance_set_parameter(snd_divebomb, "state", 0, true)
					else
						fmod_event_instance_set_parameter(snd_divebomb, "state", 1, true)
				}
			}
			else
			{
				if state == states.backbreaker && tauntstoredstate == states.machcancel
					fmod_event_instance_set_paused(snd_wallbounce, true)
				else if fmod_event_instance_is_playing(snd_wallbounce)
					fmod_event_instance_stop(snd_wallbounce, true)
				if fmod_event_instance_is_playing(snd_divebomb)
					fmod_event_instance_stop(snd_divebomb, true)
			}
		
			// noise firemouth
			if state == states.firemouth && sprite_index == spr_playerN_firemouthspin
			{
				if (!fmod_event_instance_is_playing(snd_noisefiremouth))
					fmod_event_instance_play(snd_noisefiremouth)
				sound_instance_move(snd_noisefiremouth, x, y)
			}
			else if fmod_event_instance_is_playing(snd_noisefiremouth)
				fmod_event_instance_stop(snd_noisefiremouth, false)
		
			// noise rushdown
			if sprite_index == spr_playerN_rushdown
			{
				if (!fmod_event_instance_is_playing(snd_rushdown))
					fmod_event_instance_play(snd_rushdown)
				sound_instance_move(snd_rushdown, x, y)
			}
			else
				fmod_event_instance_stop(snd_rushdown, true)
		
			// boxxed mini jetpack
			if state == states.boxxedpepjump
			{
				if (sprite_index == spr_playerN_boxxedjetpack && (!fmod_event_instance_is_playing(snd_minijetpack)))
					fmod_event_instance_play(snd_minijetpack)
				sound_instance_move(snd_minijetpack, x, y)
				if sprite_index == spr_playerN_boxxedjetpack
					fmod_event_instance_set_parameter(snd_minijetpack, "state", 0, true)
				else
					fmod_event_instance_set_parameter(snd_minijetpack, "state", 1, true)
			}
			else if fmod_event_instance_is_playing(snd_minijetpack)
				fmod_event_instance_set_parameter(snd_minijetpack, "state", 1, true)
		
			// air spin
			if ((sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend) && (state == states.mach2 || state == states.mach3 || ((tauntstoredstate == states.mach2 || tauntstoredstate == states.mach3) && state == states.chainsaw)))
			{
				if (!fmod_event_instance_is_playing(snd_airspin))
					fmod_event_instance_play(snd_airspin)
				sound_instance_move(snd_airspin, x, y)
			}
			else if fmod_event_instance_is_playing(snd_airspin)
			{
				if (sprite_index == spr_mach || sprite_index == spr_mach4 || sprite_index == spr_crazyrun)
					sound_play_3d("event:/sfx/playerN/wallbounceland", x, y)
				fmod_event_instance_stop(snd_airspin, true)
			}
		}
		else
		{
			// not noise, stop his sounds
			fmod_event_instance_stop(snd_divebomb, true)
			if fmod_event_instance_get_paused(snd_wallbounce)
				fmod_event_instance_set_paused(snd_wallbounce, false)
			fmod_event_instance_stop(snd_wallbounce, true)
			fmod_event_instance_stop(snd_minigun, true)
			fmod_event_instance_stop(snd_noisefiremouth, true)
			fmod_event_instance_stop(snd_airspin, true)
			fmod_event_instance_stop(snd_minijetpack, true)
		}
	
		// pizzelle flipping
		if SUGARY_SPIRE
		{
			if (sprite_index == spr_playerSP_mach2jump)
			{
				if !fmod_event_instance_is_playing(flippingsnd)
					fmod_event_instance_play(flippingsnd);
			
				fmod_event_instance_set_paused(flippingsnd, false);
				sound_instance_move(flippingsnd, x, y);
			}
			else
				fmod_event_instance_stop(flippingsnd, true);
		}
		
		// breakdance
		fmod_event_instance_set_3d_attributes(breakdancesnd, x, y);
		fmod_event_instance_set_3d_attributes(breakdancecancelsnd, x, y);
		
		// cosmic
		var pitch = noone;
		if check_skin(SKIN.cosmic, character, paletteselect)
		{
			if global.time % 5 == 0 && visible
			{
				with instance_create(x + random_range(-50, 50), y + random_range(-50, 50), obj_keyeffect)
					image_blend = random_cosmic_color();
			}
			
			pitch = 1 + sin(current_time / 10) * .1;
			did_cosmic = true;
		}
		else if did_cosmic
		{
			pitch = 1;
			did_cosmic = false;
		}
		
		if pitch != noone
		{
			array_foreach(player_list_sounds(), method({pitch: pitch}, function(value, index)
			{
				fmod_event_instance_set_pitch(value, pitch);
			}));
		}
	}
	
	// dead doise sound
	if instance_exists(obj_noiseanimatroniceffect) && (!instance_exists(obj_jumpscare) || obj_jumpscare.sprite_index == spr_tvstatic)
	{
		if !fmod_event_instance_is_playing(snd_noiseanimatronic)
			fmod_event_instance_play(snd_noiseanimatronic);
		sound_instance_move(snd_noiseanimatronic, obj_noiseanimatroniceffect.x, obj_noiseanimatroniceffect.ystart);
	}
	else if (character == "N" or character == "D") && state == states.animatronic && !instance_exists(obj_noiseanimatroniceffect) && (!instance_exists(obj_jumpscare) || obj_jumpscare.sprite_index == spr_tvstatic)
	{
		if !fmod_event_instance_is_playing(snd_noiseanimatronic)
			fmod_event_instance_play(snd_noiseanimatronic);
		sound_instance_move(snd_noiseanimatronic, x, y);
	}
	else if instance_exists(obj_noiseboss)
	{
		if obj_noiseboss.sprite_index == spr_doise_deadair || obj_noiseboss.sprite_index == spr_playerN_animatronic
		{
			if !fmod_event_instance_is_playing(snd_noiseanimatronic)
				fmod_event_instance_play(snd_noiseanimatronic);
			sound_instance_move(snd_noiseanimatronic, obj_noiseboss.x, obj_noiseboss.y);
		}
		else
			fmod_event_instance_stop(snd_noiseanimatronic, true);
	}
	else if instance_exists(obj_doisedead)
	{
		if !fmod_event_instance_is_playing(snd_noiseanimatronic)
			fmod_event_instance_play(snd_noiseanimatronic);
		sound_instance_move(snd_noiseanimatronic, obj_doisedead.x, obj_doisedead.y);
	}
	else
		fmod_event_instance_stop(snd_noiseanimatronic, true);
}
