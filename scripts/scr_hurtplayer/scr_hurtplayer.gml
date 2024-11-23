function scr_hurtplayer(player)
{
	var _obj = object_index;
	var _savedstate = player.state;
	var _hurt = false;
	var _swap = false;
	
	with player
	{
		if global.failcutscene || instance_exists(obj_endlevelfade)
		{
			
		}
		
		// auto parry
		else if IT_APRIL && (state == states.mach3 or (state == states.grab && sprite_index == spr_swingding))
		{
			sound_instance_move(global.snd_parry, x, y);
			fmod_event_instance_play(global.snd_parry);
			
			if state == states.grab
            {
                var _gby = ((object_index == obj_player1) ? 1 : 2);
                with (obj_baddie)
                {
                    if ((state == states.grabbed) && (grabbedby == _gby))
                        instance_destroy();
                }
            }
			state = states.parry;
			if (!isgustavo)
				sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
			else
				sprite_index = spr_ratmount_spit;
            image_index = 0;
            image_speed = 0.35;
            taunttimer = 20;
            movespeed = 8;
            parry_inst = noone;
            parry_count = parry_max;
            with (instance_create(x, y, obj_parryeffect))
                image_xscale = other.xscale;
            flash = true;
		}
		
		else if (state == states.ratmounthurt || state == states.duel || state == states.supergrab || state == states.pizzaface_phase2transition || state == states.parry || instance_exists(obj_vigilante_duelintro) || state == states.taxi || state == states.spaceshuttle || state == states.tube || state == states.debugstate || state == states.golf || state == states.slipbanan)
		or (global.noisejetpack && (character != "N" || noisepizzapepper))
		or (holycross > 0 || invtime > 0)
		or (sprite_index == spr_jetpackstart2)
		or ((state == states.backbreaker && (parrytimer > 0 || instance_exists(obj_parryhitbox) || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4 || sprite_index == spr_ratmount_supertaunt)) || state == states.chainsaw || state == states.phase1hurt || state == states.actor || instance_exists(obj_bossdark))
		{
			// ignore damage
		}
		
		else if !IT_FINAL && state == states.tumble
		{
			
		}
		
		else if (global.kungfu)
		{
			if (state == states.blockstance)
			{
				if (sprite_index != spr_player_airattackstart)
				{
					instance_create(x, y, obj_parryeffect);
					image_index = 0;
				}
				sprite_index = spr_player_airattackstart;
				hsp = -xscale * 2;
			}
			else if (state != states.thrown && state != states.hit && !hurted)
			{
				instance_create(x, y, obj_parryeffect);
				repeat (5)
				{
					with (create_debris(x, y, spr_slapstar))
						vsp = irandom_range(-6, -11);
				}
				hitLag = 3;
				hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
				state = states.hit;
				hitstunned = 50;
				hurted = true;
				alarm[7] = hitstunned + 30;
				hithsp = 12;
				hitvsp = -5;
				hitX = x;
				hitY = y;
				sprite_index = spr_hurt;
				if (global.hp > 1)
				{
					global.hp--;
					with obj_camera
						healthshaketime = 60;
				}
				else
				{
					with (obj_music)
						arena = false;
					global.kungfu = false;
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom;
						instance_create(x, y, obj_fadeout);
					}
				}
			}
		}
		
		else if (isgustavo)
		{
			if (!hurted && !cutscene && state != states.secretenter)
			{
				if (x != other.x)
					xscale = sign(other.x - x);
				if (irandom(100) <= 50)
				{
					sound_instance_move(snd_voicehurt, x, y);
					fmod_event_instance_play(snd_voicehurt);
				}
				state = states.ratmounthurt;
				movespeed = 6;
				vsp = -9;
				flash = true;
				sound_play_3d("event:/sfx/pep/hurt", x, y);
				alarm[8] = 100;
				alarm[5] = 2;
				alarm[7] = 150;
				hurted = true;
				instance_create(x, y, obj_spikehurteffect);
				_hurt = true;
				_swap = swap_player(true);
			}
		}
		
		else if (instance_exists(obj_pizzafaceboss) && obj_pizzafaceboss.state == states.transition)
		or (instance_exists(obj_pizzafaceboss_p2) && obj_pizzafaceboss_p2.state == states.fall)
		or (state == states.shotgundash)
		or ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.knightpepbump) && !cutscene)
		or (state == states.ghost)
		or (state == states.slipnslide)
		or (state == states.trickjump or state == states.ratmounttrickjump)
		or (state == states.chainsawbump)
		or (state == states.bombpep && !hurted)
		or (state == states.rideweenie)
		or (state == states.slipnslide)
		or (state == states.frozen)
		{
			// ignore damage
		}
		else if (state == states.ghostpossess)
		{
			if (instance_exists(possessID) && object_get_parent(possessID) == obj_baddie)
			{
				state = states.ghost;
				with (obj_baddie)
				{
					if (is_controllable && state == states.ghostpossess && playerid == other.id)
						instance_destroy();
				}
			}
		}
		else if state == states.punch && !string_pos("breakdancesuper", sprite_get_name(sprite_index)) && !string_pos("uppercut", sprite_get_name(sprite_index))
		&& (string_pos("breakdance", sprite_get_name(sprite_index)) or string_pos("buttattack", sprite_get_name(sprite_index)))
		{
			// ignore damage (breakdance)
		}
		else if (pizzashield == 1)
		{
			pizzashield = false;
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_pizzashield_collectible;
			hsp = -xscale * 4;
			vsp = -5;
			state = states.bump;
			sprite_index = spr_bump;
			invhurt_buffer = 120;
			alarm[8] = 60;
			alarm[7] = 120;
			hurted = true;
			sound_play_3d("event:/sfx/pep/hurt", x, y);
		}
		else if (state != states.hurt && state != states.ratmounthurt && state != states.grabbed && (hurted == 0 || state == states.cheesepep || state == states.cheesepepstickside || state == states.cheesepepstickup) && cutscene == 0)
		{
			if (state == states.animatronic)
			{
				with (instance_create(x, y, obj_peshinodebris))
					image_index = 0;
				with (instance_create(x, y, obj_peshinodebris))
					image_index = 1;
				with (instance_create(x, y, obj_peshinodebris))
					image_index = 2;
			}
			if (state == states.barrel || state == states.barrelclimbwall || state == states.barreljump || state == states.barrelslide)
			{
				repeat (4)
					create_debris(x, y, spr_barreldebris);
			}
			var _old_xscale = xscale;
			if (x != other.x)
				xscale = sign(other.x - x);
			if (state == states.mort || state == states.morthook || state == states.mortjump || state == states.mortattack)
			{
				sound_play_3d("event:/sfx/mort/mortdead", x, y);
				create_debris(x, y - 40, spr_mortdead);
			}
			if (instance_exists(obj_hardmode))
				global.heatmeter_count = (global.heatmeter_threshold - 1) * global.heatmeter_threshold_count;
			_hurt = true;
			pistolanim = noone;
			//if (character == "V" && !instance_exists(obj_bosscontroller))
			//	global.playerhealth -= 25;
			if (global.kungfu)
			{
				if (global.hp > 1)
				{
					global.hp--;
					with obj_camera
						healthshaketime = 60;
				}
				else
				{
					with (obj_music)
						arena = false;
					global.kungfu = false;
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom;
						instance_create(x, y, obj_fadeout);
					}
				}
			}
			if (state == states.grabbed)
			{
				if (object_index == obj_player1)
					y = obj_player2.y;
				else
					y = obj_player1.y;
			}
			if (state == states.trashroll || state == states.trashjump)
				create_debris(x, y, spr_player_trashlid);
			scr_sleep(100);
			sound_play_3d("event:/sfx/pep/hurt", x, y);
			if (irandom(100) <= 50)
				fmod_event_instance_play(snd_voicehurt);
			instance_create(x, y, obj_bangeffect);
			alarm[8] = 100;
			alarm[7] = 150;
			hurted = true;
			if (xscale == -_old_xscale)
				sprite_index = spr_hurtjump;
			else
				sprite_index = spr_hurt;
			movespeed = 8;
			vsp = -14;
			timeuntilhpback = 300;
			pistolanim = noone;
			instance_create(x, y, obj_spikehurteffect);
			state = states.hurt;
			image_index = 0;
			flash = true;
			_swap = swap_player(true);
			if (_swap)
			{
				alarm[5] = 2;
				alarm[7] = 80;
				hurted = true;
			}
			repeat (5)
				instance_create(x, y, obj_hurtstars);
		}
		if (_hurt)
		{
			notification_push(notifs.hurt_player, [player.id, _savedstate, _obj]);
			
			global.combotime = max(global.combotime - 25, 0);
			global.style = max(global.style - 25, 0);
			
			global.hurtcounter += 1;
			global.player_damage += 1;
			
			if global.swapmode
				global.swap_boss_damage++;
			global.swap_damage[player_index]++;
			
			if !isgustavo
				global.peppino_damage += 1;
			else if !_swap
				global.gustavo_damage += 1;
			
			var damage_n = global.peppino_damage;
			if isgustavo
				damage_n = global.gustavo_damage;
			
			if global.swapmode
			{
				damage_n = global.swap_damage[player_index];
				if _swap && noisecrusher
				{
					global.gustavo_damage += 1;
					damage_n = global.gustavo_damage;
				}
			}
			
			// tv expression
			if !isgustavo
				tv_do_expression(spr_tv_exprhurt);
			else
				tv_do_expression(spr_tv_hurtG);
			
			// You've hurt Peppino 10 times...
			if damage_n % 10 == 0
			{
				var hurtTV;
				if character != "N"
					hurtTV = choose(spr_tv_exprhurt1, spr_tv_exprhurt2, spr_tv_exprhurt3, spr_tv_exprhurt4, spr_tv_exprhurt5, spr_tv_exprhurt6, spr_tv_exprhurt7, spr_tv_exprhurt8, spr_tv_exprhurt9, spr_tv_exprhurt10);
				else
					hurtTV = choose(spr_tv_exprhurtN1, spr_tv_exprhurtN2, spr_tv_exprhurtN3, spr_tv_exprhurtN4, spr_tv_exprhurtN5, spr_tv_exprhurtN6, spr_tv_exprhurtN7, spr_tv_exprhurtN8, spr_tv_exprhurtN9, spr_tv_exprhurtN10);
				tv_do_expression(hurtTV);
				
				var txt = "hurt_mod";
				if global.hud != hudstyles.final
					txt = "message_hurt";
				
				var txt = embed_value_string(lstr(txt), [scr_charactername(character, isgustavo or noisecrusher), damage_n]);
				if global.hud == hudstyles.final
				{
					instance_destroy(obj_transfotip);
					create_transformation_tip(txt);
				}
				else
				{
					old_hud_message(string_upper(txt), 150);
					with obj_tv
					{
						alarm[0] = 150;
						image_speed = 0.1;
						tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4);
					}
				}
			}
			
			if !global.timeattack
			{
				var loseamount = 50 * (global.stylethreshold + 1);
				if instance_exists(obj_bosscontroller)
					loseamount = 0;
				else if !global.pizzadelivery
				{
					if global.collect > 0
					{
						with instance_create(121, 60, obj_negativenumber)
							number = concat("-", loseamount);
					}
					repeat REMIX ? min(loseamount / 5, floor(global.collect / 10)) : 10
						instance_create(x, y, obj_pizzaloss);
					global.collect = max(global.collect - loseamount, 0);
				}
			}
			
			with obj_bosscontroller
			{
				if !instance_exists(obj_hpeffect)
				{
					if !global.boss_invincible
					{
						var n = 1;
						if room == boss_fakepephallway
							n = 2;
						
						repeat n
						{
							var pos = scr_bosscontroller_get_health_pos(player_hp, player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad);
							if pos != undefined
							{
								var spr_pal = other.spr_palette;
								var pal = other.paletteselect;
								var tex = global.palettetexture;
								var hp_sprite = player_hpsprite;
								if _swap
								{
									var info = other.character != "N" ? get_noise_palette_info() : get_pep_palette_info();
									spr_pal = info.spr_palette;
									pal = info.paletteselect;
									tex = info.patterntexture;
									hp_sprite = other.character != "N" ? spr_bossfight_noiseHP : spr_bossfight_playerhp;
								}
								scr_bosscontroller_particle_hp(hp_sprite, irandom(sprite_get_number(hp_sprite) - 1), pos[0], pos[1], 1, spr_pal, pal, tex);
							}
							global.bossplayerhurt = true;
							player_hp--;
						}
					}
				}
				else
				{
					var d = instance_find(obj_hpeffect, instance_number(obj_hpeffect) - 1);
					scr_bosscontroller_particle_hp(spr_bossfight_playerhp, irandom(sprite_get_number(spr_bossfight_playerhp) - 1), d.x, d.y, (d.x > (room_width / 2)) ? -1 : 1, obj_player1.spr_palette, obj_player1.paletteselect, global.palettetexture);
					instance_destroy(d);
				}
			}
			if _swap
				instance_create(0, 0, obj_swapmodeeffect);
		}
	}
}
