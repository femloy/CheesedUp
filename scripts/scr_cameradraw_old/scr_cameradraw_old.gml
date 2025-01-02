function scr_cameradraw_old()
{
	var player = obj_player1;
	if instance_exists(player)
	{
		var _state = player.state;
		if _state == states.backbreaker
		{
			with obj_teleporter
			{
				if alarm[0] > -1 or alarm[1] > -1
					_state = storedstate;
			}
			with obj_warplaser
			{
				if alarm[0] > -1 or alarm[1] > -1
					_state = storedstate;
			}
		}
		if _state == states.chainsaw or _state == states.secretenter
			_state = player.tauntstoredstate;
		
		var hudface = -1;
		
		var char = player.character;
		if player.isgustavo && char != "N"
			char = "G";
		
		switch char
		{
			case "P":
				if player.sprite_index == spr_knightpep_thunder
					hudface = spr_pepinoHUDthunder
				else if player.sprite_index != spr_knightpep_start && (_state == states.knightpep or _state == states.knightpepslopes)
					hudface = spr_pepinoHUDknight
				else if player.sprite_index == spr_bombpep_end
					hudface = spr_pepinoHUDbombend
				else if instance_exists(obj_itspizzatime) or player.sprite_index == spr_bombpep_intro or player.sprite_index == spr_bombpep_runabouttoexplode or player.sprite_index == spr_bombpep_run or player.sprite_index == spr_player_fireass or player.state == states.bombgrab
					hudface = spr_pepinoHUDscream
				else if _state == states.Sjumpland or (_state = states.freefallland && shake_mag > 0)  
					hudface = spr_pepinoHUDstun
				else if player.sprite_index == player.spr_victory or _state == states.keyget or _state == states.smirk or _state == states.gottreasure or (_state = states.bossintro && player.sprite_index == player.spr_levelcomplete)
					hudface = spr_pepinoHUDhappy
				else if player.sprite_index == player.spr_machroll or player.sprite_index == player.spr_tumble
					hudface = spr_pepinoHUDrolling
				else if (player.supercharged && !global.heatmeter) or global.stylethreshold == 2
					hudface = spr_pepinoHUDmenacing
				else if _state == states.mach1 or _state == states.tumble or _state == states.chainsaw or _state == states.freefallprep or _state == states.freefall or _state == states.tackle or _state == states.Sjump or _state == states.slam or _state == states.Sjumpprep or _state == states.grab or _state == states.punch or _state == states.backbreaker or _state == states.backkick or _state == states.uppunch or _state == states.shoulder
				or player.sprite_index == player.spr_mach1
					hudface = spr_pepinoHUDmach1
				else if _state == states.mach2 or player.sprite_index == spr_player_dive or player.sprite_index == spr_player_machslideboost or _state == states.climbwall or _state == states.handstandjump or _state == states.superslam 
					hudface = spr_pepinoHUDmach2
				else if _state == states.mach3 && player.sprite_index == spr_player_crazyrun 
					hudface = spr_pepinoHUDmach4
				else if _state == states.mach3 or player.sprite_index == spr_player_machslideboost3
					hudface = spr_pepinoHUDmach3
				else if _state == states.hurt or player.sprite_index == spr_bombpep_end or player.sprite_index == spr_player_fireassend or _state == states.timesup or _state == states.bombpep or (_state = states.bossintro &&  player.sprite_index == spr_player_bossintro) or (_state = states.bossintro &&  player.sprite_index == spr_player_idle)
					hudface = spr_pepinoHUDhurt
				else if player.angry or global.stylethreshold == 1 or global.noisejetpack
					hudface = spr_pepinoHUD3hp
				else if player.sprite_index == spr_player_hurtidle or player.sprite_index == spr_player_hurtwalk
					hudface = spr_pepinoHUD1hp
				else if PANIC or global.stylethreshold >= 3
					hudface = spr_pepinoHUDpanic
				else if player.sprite_index == spr_shotgun_pullout
					hudface = spr_pepinoHUDmenacing
				else
					hudface = spr_pepinoHUD
				break;
			
			case "N":
				if player.sprite_index == player.spr_knightpepthunder
					hudface = spr_noiseHUD_thunder
				else if player.sprite_index != player.spr_knightpepstart && (_state = states.knightpep or _state == states.knightpepslopes)
					hudface = spr_noiseHUD_knight
				else if player.sprite_index == player.spr_bombpepend
					hudface = spr_noiseHUD_bomb
				else if instance_exists(obj_itspizzatime) or player.sprite_index == player.spr_bombpepintro or player.sprite_index == player.spr_bombpeprunabouttoexplode or player.sprite_index == player.spr_bombpeprun or player.sprite_index == player.spr_fireass
					hudface = spr_noiseHUD_panic
				else if _state == states.Sjumpland or (_state = states.freefallland && shake_mag > 0)  
					hudface = spr_noiseHUD_groundpound
				else if player.sprite_index == player.spr_victory or _state == states.keyget or _state == states.smirk or _state == states.gottreasure or (_state = states.bossintro &&  player.sprite_index == player.spr_levelcomplete)
					hudface = spr_noiseHUD_happy
				else if player.supercharged
					hudface = spr_noiseHUD_menacing
				else if _state == states.mach1 or _state == states.chainsaw or _state == states.freefallprep or _state == states.freefall or _state == states.tackle or _state == states.Sjump or _state == states.slam or _state == states.Sjumpprep or _state == states.grab or _state == states.punch or _state == states.backbreaker or _state == states.backkick or _state == states.uppunch or _state == states.shoulder
					hudface = spr_noiseHUD_mach1
				else if _state == states.pogo or _state == states.mach2 or player.sprite_index == player.spr_dive or player.sprite_index == player.spr_machslideboost or _state == states.climbwall or _state == states.handstandjump or _state == states.superslam 
					hudface = spr_noiseHUD_mach2
				else if _state == states.mach3 && player.sprite_index == player.spr_crazyrun 
					hudface = spr_noiseHUD_crazyrun
				else if _state == states.mach3 or player.sprite_index == player.spr_mach3boost
					hudface = spr_noiseHUD_mach3
				else if _state == states.hurt or player.sprite_index == player.spr_bombpepend or player.sprite_index == player.spr_fireassend or _state == states.timesup or _state == states.bombpep or (_state = states.bossintro &&  player.sprite_index == player.spr_player_bossintro) or (_state = states.bossintro &&  player.sprite_index == player.spr_idle)
					hudface = spr_noiseHUD_hurt
				else if player.angry
					hudface = spr_noiseHUD_angry
				else if player.sprite_index == player.spr_hurtidle or player.sprite_index == player.spr_hurtwalk
					hudface = spr_noiseHUD_lowhealth
				else if PANIC
					hudface = spr_noiseHUD_panic
				else if player.sprite_index == player.spr_shotgunpullout or global.noisejetpack
					hudface = spr_noiseHUD_menacing
				else
					hudface = spr_noiseHUD_idle
				break;
			
			case "V":
				if (healthshaketime > 0 && playerhealthup) or player.sprite_index == spr_playerV_keydoor or _state == states.keyget or _state == states.gottreasure 
					hudface = spr_playerV_happyHUD
				else if _state == states.mach1 or _state == states.mach2 or _state == states.mach3 or _state == states.machslide or _state == states.machroll
					hudface = spr_playerV_machHUD
				else if (healthshaketime > 0 && !playerhealthup) or _state == states.hurt
					hudface = spr_playerV_hurtHUD
				else if global.panic = true
					hudface = spr_playerV_panicHUD
				else if player.angry
					hudface = spr_playerV_angryHUD
				else
					hudface = spr_playerV_normalHUD
				break;
			
			case "S":
				hudface = spr_snickHUD;
				break;
			
			case "SP":
				if SUGARY_SPIRE
				{
					if player.sprite_index == player.spr_knightpepthunder
						hudface = spr_pizzyHUDthunder
					else if player.sprite_index != player.spr_knightpepstart && (_state == states.knightpep or _state == states.knightpepslopes or _state == states.knightpepattack)
						hudface = spr_pizzyHUDknight
					else if player.sprite_index == player.spr_bombpepend
						hudface = spr_pizzyHUDbombend
					else if instance_exists(obj_itspizzatime) or player.sprite_index == player.spr_bombpepintro or player.sprite_index == player.spr_bombpeprunabouttoexplode or player.sprite_index == player.spr_bombpeprun or player.sprite_index == player.spr_fireass
						hudface = spr_pizzyHUD_panic // REPLACE
					else if _state == states.Sjumpland or (_state == states.freefallland && shake_mag > 0)  
						hudface = spr_pizzyHUDstun
					else if player.sprite_index == player.spr_victory or _state == states.keyget or _state == states.smirk or _state == states.gottreasure or (_state = states.bossintro && player.sprite_index == player.spr_levelcomplete)
						hudface = spr_pizzyHUDhappy
					//else if player.sprite_index == player.spr_machroll or player.sprite_index == player.spr_tumble
					//	hudface = spr_pepinoHUDrolling
					//else if global.combo >= 3
					//	hudface = spr_pizzyHUDmenacing
					else if _state == states.mach1 or _state == states.tackle or _state == states.slam or _state == states.grab or _state == states.punch or _state == states.backkick or _state == states.uppunch or _state == states.shoulder
						hudface = spr_pizzyHUDmach1
					else if _state == states.mach2/* or player.sprite_index == player.spr_dive*/ or _state == states.machroll or player.sprite_index == player.spr_machslideboost or _state == states.climbwall or _state == states.handstandjump or _state == states.superslam or _state == states.freefallprep
						hudface = spr_pizzyHUDmach2
					else if _state == states.mach3 && player.sprite_index == player.spr_crazyrun
						hudface = spr_pizzyHUDmach4
					else if _state == states.mach3 or player.sprite_index == player.spr_mach3boost
						hudface = spr_pizzyHUDmach3
					else if _state == states.hurt or player.sprite_index == player.spr_fireassend or _state == states.timesup or _state == states.bombpep or (_state = states.bossintro &&  player.sprite_index == player.spr_bossintro) or (_state = states.bossintro &&  player.sprite_index == player.spr_idle)
						hudface = spr_pizzyHUDhurt
					else if player.sprite_index == player.spr_bombpepend
						hudface = spr_pizzyHUDbombend
					else if _state == states.Sjumpprep
						hudface = spr_pizzyHUDsuperjumpprep
					else if _state == states.Sjump
						hudface = spr_pizzyHUDsuperjump
					else if _state == states.freefall
						hudface = spr_pizzyHUDbodyslam
					else if player.sprite_index == player.spr_bombpepend
						hudface = spr_pizzyHUDbombend
					else if _state == states.bump
						hudface = spr_pizzyHUDbump
					else if player.angry
						hudface = spr_pizzyHUD3hp
					else if player.sprite_index == player.spr_hurtidle
						hudface = spr_pizzyHUDhurt // REPLACE
					else if global.panic or global.snickchallenge or global.miniboss
						hudface = spr_pizzyHUD // REPLACE 
					else if player.sprite_index == player.spr_shotgunpullout
						hudface = spr_pizzyHUDmenacing
					else if _state == states.removed_state
						hudface = spr_pizzyHUDcotton
					else
						hudface = spr_pizzyHUD;
				}
				break;
			
			case "G":
				if _state == states.gottreasure or _state == states.keyget
					hudface = spr_gustavoHUDhappy;
				else if _state == states.ratmounthurt or _state == states.hurt
					hudface = spr_gustavoHUDhurt;
				else if _state == states.backbreaker or _state == states.ratmountskid or _state == states.ratmountattack or _state == states.ratmountgrind or _state == states.ratmountgroundpound or _state == states.ratmountpunch or _state == states.ratmounttrickjump
				or (_state == states.ratmountjump && (player.sprite_index == player.spr_ratmount_dashjump or player.sprite_index == player.spr_lonegustavodashjump))
					hudface = spr_gustavoHUDmach1;
				else if (_state == states.ratmount && (player.sprite_index == player.spr_ratmount_attack or player.sprite_index == player.spr_lonegustavodash))
					hudface = spr_gustavoHUDmach2;
				else if _state == states.ratmount && (player.sprite_index == player.spr_ratmount_mach3 or player.sprite_index == player.spr_lonegustavomach3)
					hudface = spr_gustavoHUDmach3;
				else if player.angry
					hudface = spr_gustavoHUD3hp;
				else if PANIC
					hudface = spr_gustavoHUDpanic;
				else
					hudface = spr_gustavoHUD;
				break;
		}
		
		var xx = 125;
		if SUGARY_SPIRE
		{
			if _state == states.removed_state or _state == states.removed_state or _state == states.removed_state
				hudface = spr_pizzyHUDcotton;
			if player.character == "SP"
				xx -= 20;
		}
		
		// actual player
		if sprite_exists(hudface)
		{
			shader_set(global.Pal_Shader);
			pal_swap_player_palette(hudface, image_index, 1, 1, player);
			draw_sprite_ext(hudface, image_index, xx, global.heatmeter ? 125 : 100, 1, 1, 0, c_white, alpha);
			
			// noise jetpack
			var _red = global.noisejetpack && (obj_player1.character != "N" || obj_player1.noisepizzapepper);
			if _red
			{
				cuspal_reset();
				pal_swap_set(obj_player1.spr_palette, 2, false);
				draw_sprite_ext(hudface, image_index, xx, global.heatmeter ? 125 : 100, 1, 1, 0, c_white, alpha);
			}
			pal_swap_reset();
			
			// image speed
			var sprspd = sprite_get_speed(hudface);
			if sprspd != 1
				image_speed = sprspd;
			else
				image_speed = 0.35;
		}
		
		// bwah
		if REMIX
			scr_rankbubbledraw(40, 40);
		
		// heat meter
		if global.heatmeter
		{
			with obj_stylebar
			{
				depth = other.depth - 1;
				lang_draw_sprite(sprite, index, 230, 75);
			}
		}
		
		// speed meter
		if !(player.character == "N" && player.noisetype == noisetype.pogo)
		{
			var yy = 140;
			if player.character == "SP" or player.character == "S"
				yy = 164;
			
			if global.heatmeter
				yy += 25;
			
			var speedbaractive = _state == states.mach1 or _state == states.mach2 or _state == states.mach3 or _state == states.climbwall or _state == states.machslide or _state == states.machroll or _state == states.handstandjump
			or (player.character == "S" && _state == states.normal) or ((_state == states.ratmount or _state == states.ratmountjump) && player.ratmount_movespeed > 8);
			
			var frame = 0, movespeed = abs(player.movespeed);
			
			if movespeed < 2.4 or !speedbaractive
				frame = 0;
			else if speedbaractive
			{
				if movespeed >= 2.4 && movespeed < 4.8
					frame = 1;
				else if movespeed >= 4.8 && movespeed < 7.2
					frame = 2;
				else if movespeed >= 7.2 && movespeed < 9.6
					frame = 3;
				else if movespeed >= 9.6 && movespeed < 12
					frame = 4;
				else if movespeed >= 12
				{
					frame = -1;
					draw_sprite_ext(spr_speedbarmax, image_index, xx, yy, 1, 1, 0, c_white, alpha);
				}
			}
			if frame >= 0
				draw_sprite_ext(spr_speedbar, frame, xx, yy, 1, 1, 0, c_white, alpha);
		}
		
		// pogo noise bullshit
		if player.character == "N" && player.noisetype == noisetype.pogo
		{
			with other
			{
				if player.pogospeed < 10
					draw_sprite_ext(spr_speedbar, 0, xx, 140, 1, 1, 0, c_white, alpha)
				else if player.pogospeed >= 10 && player.pogospeed < 14 
					draw_sprite_ext(spr_speedbar, 3, xx, 140, 1, 1, 0, c_white, alpha)
				else if player.pogospeed >= 14
					draw_sprite_ext(spr_speedbarmax, image_index, xx, 140, 1, 1, 0, c_white, alpha)
			}
		}
		
		// fade
		if (player.y < camera_get_view_y(view_camera[0]) + 200 && player.x < camera_get_view_x(view_camera[0]) + 200)
		or obj_tv.manualhide
			alpha = 0.5;
		else
			alpha = 1;
		
		/*draw_set_font(lang_get_font("bigfont"));
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		if obj_player1.character == "V"
			draw_text(200 + healthshake, 125 + healthshake, global.playerhealth);*/
	}
}
