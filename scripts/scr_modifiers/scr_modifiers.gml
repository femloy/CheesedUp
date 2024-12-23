 globalvar MOD;
global.modifier_failed = false;

function reset_modifier()
{
	MOD = 
	{
		// Global modifiers
		Encore: false,
		Pacifist: false,
		NoToppings: false,
		HardMode: false,
		Mirror: false,
		DeathMode: false,
		JohnGhost: false,
		Spotlight: false,
		CosmicClones: false,
		EscapeInvert: false,
		//PurpleBlockLand: false,
		FromTheTop: false,
		GravityJump: false,
		DoubleTrouble: false,
		Hydra: false,
		GreenDemon: false,
		Birthday: false,
		Peddito: false,
		SuddenDeath: false,
		Golf: false,
		
		// Entrance
		NoiseGutter: false,
		
		// CTOP
		CTOPLaps: false,
		
		// Snick Challenge
		OldLevels: false,
		
		// Grinch - Remove restart cube
		// GOLF - Remove pizzaball blocks
		// Snick Challenge - Remove snick
		EasyMode: false,
		
		// Secrets Of The World
		Ordered: false,
		SecretInclude: 0, // 0 = Vanilla, 1 = Cheesed Up
	}
	
	global.hardmode = false;
	with obj_deathmode
		active = false;
	with obj_player
		gravityjump = false;
	global.world_gravity = 1;
}
reset_modifier();

function fail_modifier(flags, value = true)
{
	if flags == value
	{
		global.modifier_failed = true;
		instance_create_unique(obj_player1.x, obj_player1.y, obj_genericdeath);
	}
}

function pre_player_modifiers()
{
	//if live_call() return live_result;
	
	with obj_persistent
	{
		// ctop lapping
		if (global.leveltosave == "exit" or room == freezer_lap) && !check_lap_mode(lapmodes.normal)
		{
			with obj_baddie
			{
				if global.lap && (object_index == obj_robot or object_index == obj_ninja or object_index == obj_bazookabaddie)
				{
					escape = true;
					event_perform(ev_other, ev_room_start);
				}
				else if object_index != obj_ghostknight && !in_saveroom(id, global.escaperoom)
					add_saveroom(id, global.escaperoom);
			}
			with obj_collect
			{
				instance_change(obj_escapecollect, false);
				event_perform_object(obj_escapecollect, ev_create, 0);
			}
			with obj_bigcollect
			{
				instance_change(obj_escapecollectbig, false);
				event_perform_object(obj_escapecollectbig, ev_create, 0);
		
				x -= 32;
				y -= 32;
				if global.panic
					image_alpha = 1;
			}
		}

		if SUGARY_SPIRE
		{
			// sucrose lap 2 collects
			if global.leveltosave == "sucrose"
			{
				with obj_collect
				{
					if !in_saveroom(id, global.escaperoom)
						add_saveroom(id, global.escaperoom);
				}
				with obj_bigcollect
				{
					if !in_saveroom(id, global.escaperoom)
						add_saveroom(id, global.escaperoom);
				}
			}
		}

		// lap 3 blocks
		if (instance_exists(obj_pizzaface) or check_lap_mode(lapmodes.laphell))
		&& global.laps >= 2 && global.chasekind == chasekinds.blocks
		{
			with obj_solid
			{
				if place_meeting(x, y, obj_reverselapblock)
					instance_destroy();
			}
			with obj_platform
			{
				if place_meeting(x, y, obj_reverselapblock)
					instance_destroy();
			}
			with obj_lapblock
			{
				with instance_place(x, y, obj_teleporter)
					instance_destroy();
			}
			if room == graveyard_9b with obj_ghostwall
				instance_destroy();
			if room == space_11 with obj_antigrav
				instance_destroy();
			if room == industrial_2 with obj_destructibleplatform
				instance_destroy();
	
			var tiles = room_get_tile_layers();
			for(var i = 0, n = array_length(tiles); i < n; ++i)
			{
				var thislayer = tiles[i].layer_id;
				var lap3layer = layer_get_id(tiles[i].layer_name + "_Egg");
		
				if lap3layer != -1
				{
					layer_set_visible(lap3layer, true);
					layer_destroy(thislayer);
					
					with obj_secretblock
					{
						if targettiles == tiles[i].layer_name
							targettiles += "_Egg";
						else if is_array(targettiles)
							array_push(targettiles, tiles[i].layer_name + "_Egg");
					}
					with obj_secretbigblock
					{
						if targettiles == tiles[i].layer_name
							targettiles += "_Egg";
						else if is_array(targettiles)
							array_push(targettiles, tiles[i].layer_name + "_Egg");
					}
					with obj_secretmetalblock
					{
						if targettiles == tiles[i].layer_name
							targettiles += "_Egg";
						else if is_array(targettiles)
							array_push(targettiles, tiles[i].layer_name + "_Egg");
					}
				}
			}
		}
		else
			instance_destroy(obj_lapblock);

		// swap john and gate
		if MOD.FromTheTop
		{
			MOD.EscapeInvert = true;
			with obj_randomsecret
			{
				if array_length(levels) == 0
					exit;
			}
	
			if obj_player1.targetDoor == "A" && !instance_exists(obj_randomsecret)
			{
				var levelinfo = level_info(global.leveltosave);
				if levelinfo != noone
				{
					if room == levelinfo.gate_room
					{
						obj_player1.targetDoor = "GATE";
						room_goto(levelinfo.john_room);
						delete levelinfo;
						exit;
					}
				}
				delete levelinfo;
			}
	
			var gate = noone;
			if instance_exists(obj_exitgate)
				var gate = obj_exitgate.id;
	
			var john = noone;
			if instance_exists(obj_hungrypillar)
				var john = obj_hungrypillar.id;
	
			with gate
			{
				instance_change(obj_hungrypillar, false);
				event_perform_object(obj_hungrypillar, ev_create, 0);
				y += 16;
			}
			with john
			{
				instance_change(obj_exitgate, false);
				event_perform_object(obj_exitgate, ev_create, 0);
				direct = image_xscale;
				image_xscale = 1;
		
				y -= 16;
				instance_create(x - 16, y + 96, obj_doorX, {door: "GATE"});
				with obj_ghosthazard
					if global.panic instance_destroy();
			}
			instance_destroy(obj_PTG, false);
	
			// level changes
			switch room
			{
				#region MEDIEVAL
		
				case medieval_10:
					with obj_swordstone {x = 1086; y = 946; with obj_grabmarker {if ID == other.id x = other.x}};
					with obj_music {if is_struct(music) fmod_event_instance_set_parameter(music.event, "state", 2, 1)}
					break;
				case medieval_9:
					with obj_keydoor {instance_destroy(instance_nearest(x, y, obj_ratblock), false)}
					break;
				case medieval_3:
					instance_destroy(obj_ratblock, false);
					break;
		
				#endregion
				#region RUIN
		
				case ruin_11:
					with obj_music {if is_struct(music) fmod_event_instance_set_parameter(music.event, "state", 1, 1)}
					break;
				case ruin_7:
					with obj_baddiespawner {x = 1426; y = 1056;}
					break;
				case ruin_6:
					with obj_door {instance_destroy(instance_nearest(x, y, obj_ratblock), false)}
					break;
		
				#endregion
				#region BADLAND
		
				case badland_9:
					with obj_exitgate {instance_destroy(); instance_create(x - 50, y + 32, obj_doorblocked)}
					break;
				case badland_10:
					with instance_create(800, 320, obj_exitgate) {image_index = 0;}
					break;
				case badland_mart5: case badland_mart4: case badland_mart3: case badland_mart2: case badland_mart1:
				case badland_7:
					with obj_baddie {escape = !escape;}
					break;
		
				#endregion
				#region WASTEYARD
		
				case graveyard_5c:
					if global.panic instance_destroy(obj_ghostfollow);
					break;
		
				#endregion
				#region FARM
		
				case farm_6:
					with obj_gerome {if !in_saveroom() {instance_destroy(); with instance_create(x, y, obj_bigcollect) {ID = other.id}}}
					break;
				case farm_2:
					if !global.gerome && !global.treasure instance_create(690, 210, obj_gerome);
					break;
		
				#endregion
				#region SALOON
		
				case saloon_5:
					with obj_weeniemount {instance_destroy(instance_nearest(x, y, obj_ratblock), false); x = 2140;}
					with obj_banditochicken {escape = !escape; instance_create(x - 32, y - 32, obj_hiddenobject)}
					with obj_racestart {with instance_create(x, y, obj_hiddenobjecttrigger) {image_yscale = other.image_yscale}}
					break;
				case saloon_2:
					with obj_horseyblock {instance_destroy()}
					with obj_racestart {instance_destroy()}
					with obj_horsey {instance_destroy()}
					with obj_raceend {instance_destroy()}
					break;
				case saloon_4:
					with obj_door self.john = false;
					break;
		
				#endregion
				#region PLAGE
		
				case plage_cavern2:
					with instance_create(800, 992, obj_reverseminipillar) {image_yscale = 12};
					//with instance_create(1024, 1312, obj_reverseminipillar) {image_xscale = 4};
					break;
				case plage_shipmain:
					with obj_gerome instance_destroy();
					break;
				case plage_entrance:
					with obj_boxofpizza {instance_destroy(); if !global.gerome && !global.treasure instance_create(x, y - 14, obj_gerome)}
					break;
		
				#endregion
				#region FOREST
		
				case forest_john:
					with obj_music {if is_struct(music) fmod_event_instance_set_parameter(music.event, "state", 2, 1)}
					with obj_player
					{
						if targetDoor == "GATE"
						{
							if character == "N"
								noisecrusher = true;
							else
								isgustavo = true;
						}
					}
					break;
				case forest_G5:
					with obj_pickle {escape = !escape;}
					break;
				case forest_1:
					with obj_reverseminipillar instance_destroy();
					break;
				case forest_16:
					with obj_gerome {if !in_saveroom() {instance_destroy(); with instance_create(x, y, obj_bigcollect) {ID = other.id}}}
					break;
				case forest_lap:
					if !global.gerome && !global.treasure with instance_create(1048, 850, obj_gerome) image_xscale = -1;
					break;
		
				#endregion
				#region GOLF
		
				case minigolf_8: case minigolf_10: case minigolf_11:
					with obj_pizzaball escape = !escape;
					break;
				case minigolf_3: case minigolf_2: case minigolf_1:
					if !global.panic or room == minigolf_1
					{
						with obj_pizzaballblock instance_destroy(id, false);
						if room != minigolf_1
						{
							with obj_goalsign instance_destroy(id, false);
							with obj_ballgoal instance_destroy(id, false);
							with obj_golfhoop instance_destroy(id, false);
							with obj_magnet instance_destroy(id, false);
						}
					}
					break;
				case minigolf_4:
					with obj_door self.john = false;
					break;
				case minigolf_7:
					with obj_bigcheese escape = !escape;
					break;
		
				#endregion
				#region SPACE
		
				case space_7:
					with obj_gerome {if !in_saveroom() {instance_destroy(); with instance_create(x, y, obj_bigcollect) {ID = other.id}}}
					break;
				case space_lap:
					if !global.gerome && !global.treasure instance_create(364, 434, obj_gerome);
					break;
		
				#endregion
				#region STREET
		
				case street_john:
					with obj_player
					{
						if targetDoor == "GATE"
						{
							if character == "N"
								noisecrusher = true;
							else
								isgustavo = true;
							with obj_music
							{
								if music != noone
									fmod_event_instance_stop(music.event, true);
						
								music = ds_map_find_value(music_map, street_1) ?? noone;
								if music != noone
								{
									fmod_event_instance_set_parameter(music.event, "state", 1, true);
									fmod_event_instance_play(music.event);
								}
							}
						}
					}
					break;
				case street_jail:
					with obj_baddie escape = !escape;
					with obj_taxi escape = false;
					break;
				case street_3:
					with obj_taxi escape = true;
					break;
				case street_house3:
					with obj_taxi escape = true;
					break;
		
				#endregion
				#region FREEZER
		
				case freezer_escape1:
					with obj_player {if targetDoor == "GATE" global.noisejetpack = true;}
					with obj_music {if music != noone fmod_event_instance_set_parameter(music.event, "state", 2, true)}
					break;
				case freezer_lap:
					instance_destroy(obj_freemilk, false);
					break;
				case freezer_upgrade:
					with instance_create(736, 288, obj_giantcollect)
						ID = obj_noisejetpack.id;
					instance_destroy(obj_noisejetpack, false);
					break;
		
				#endregion
				#region INDUSTRIAL
		
				case industrial_5:
					with obj_music {if music != noone fmod_event_instance_set_parameter(music.event, "state", 1, true)}
					with obj_exitgate {instance_destroy(instance_nearest(x, y, obj_ratblock), false)}
					with obj_priest {x = 2916; y = 210}
					instance_create(3456, 352, obj_reverseminipillar);
					break;
				case industrial_4:
					with obj_gerome {if !in_saveroom() {instance_destroy(); with instance_create(x, y, obj_bigcollect) {ID = other.id}}}
					break;
				case industrial_1:
					with obj_hungrypillar {x = 416; y = 784;}
					with obj_boxofpizza {with instance_create(x - 32, y + 32, obj_solid) image_xscale = 2; instance_change(obj_gerome, true); y -= 14;}
					break;
				case industrial_2:
					instance_destroy(obj_reverseminipillar, false);
					with obj_geromedoor
					{
						instance_destroy(instance_nearest(x, y, obj_door), false);
						instance_destroy(instance_nearest(x, y, obj_dashpad), false);
				
						var sol = collision_line(x + 50, y, x, y - 100, obj_solid, false, false);
						sol.image_xscale += 1;
						var sol = collision_line(x + 50, y, x + 200, y, obj_solid, false, false);
						sol.y += 32 * 4;
						sol.image_yscale -= 4;
						sol.image_xscale += 3;
						var sol = collision_line(x + 50, y, x + 400, y, obj_solid, false, false);
						sol.image_yscale -= 6;
					}
					with instance_create(320, 2080, obj_secretbigblock)
					{
						ID = "fuck";
				
						image_xscale = 2.5;
						image_yscale = 2;
						particlespr = spr_industrialdebris;
				
						instance_create(x + 32, y + 32 * 4, obj_cutoff);
						instance_create(x + 32 + 64, y + 32 * 4, obj_cutoff);
						instance_create(x + 64 + 64, y + 32 * 4, obj_cutoff);
				
						with instance_create(x + 32, y, obj_cutoff)
							image_angle = 180;
						with instance_create(x + 32 + 64, y, obj_cutoff)
							image_angle = 180;
						with instance_create(x + 64 + 64, y, obj_cutoff)
							image_angle = 180;
					}
					break;
		
				#endregion
				#region SEWER
		
				// TODO
				case sewer_8:
					with obj_baddie escape = true;
					break;
		
				#endregion
				#region KIDSPARTY
		
				// TODO
				case kidsparty_john:
					with obj_shotgun {x = obj_dashpad.x; y = obj_dashpad.y;}
					instance_destroy(obj_dashpad);
					break;
				case kidsparty_floor4_3:
					instance_destroy(obj_spike, false);
					break;
		
				#endregion
		
				// TODO WAR CHATEAU
			}
	
			with obj_gustavoswitch
				escape = !escape;
			with obj_peppinoswitch
				escape = !escape;
			if global.noisejetpack && room != freezer_secret3
				instance_destroy(obj_pizzapepper);
		}

		// escape inversion
		if MOD.EscapeInvert
		{
			if !room_is_secret(room) && !string_starts_with(room_get_name(room), "street_house")
			{
				with obj_baddie
				{
					if !place_meeting(x, y, obj_secretbigblock) && object_index != obj_farmerbaddie3 && object_index != obj_treasureguy
						escape = !escape;
				}
				with obj_collect
				{
					if object_index == obj_escapecollect
					{
						image_alpha = 1;
						instance_change(obj_collect, false);
					}
					else if object_index == obj_collect
						instance_change(obj_escapecollect, false);
					event_perform_object(object_index, ev_create, 0);
				}
				with obj_bigcollect
				{
					if object_index == obj_escapecollectbig
					{
						image_alpha = 1;
						x += 32;
						y += 32;
						instance_change(obj_bigcollect, false);
					}
					else if object_index == obj_bigcollect
					{
						x -= 32;
						y -= 32;
						instance_change(obj_escapecollectbig, false);
					}
					event_perform_object(object_index, ev_create, 0);
				}
			}
	
			with obj_minipillar
				type = 0;
			with obj_reverseminipillar
				type = 1;
			with obj_minipillar
				instance_change(obj_reverseminipillar, false);
			with obj_reverseminipillar
			{
				if type == 1
					instance_change(obj_minipillar, false);
			}
		}

		// double trouble
		if MOD.DoubleTrouble
		{
			with obj_baddie
			{
				var floating = scr_solid(x, y + 1);
		
				x -= 50;
				if scr_solid(x, y) or (!floating && !scr_solid(x, y + 1))
					x += 50;
		
				with instance_copy(true)
				{
					ID = $"{string(other.id)}-2";
			
					x += 100;
					if scr_solid(x, y) or (!floating && !scr_solid(x, y + 1))
						x = other.x;
			
					escape = other.escape;
					elite = other.elite;
					state = other.state;
				}
			}
		}

		if is_holiday(holiday.loy_birthday)
		{
			random_set_seed(real(room));
			for(var yy = 0; yy < room_height; yy += 300)
			{
				for(var xx = 0; xx < room_width; xx += 300)
					instance_create(xx + random_range(-200, 200), yy + random_range(-100, 100), obj_balloon);
			}
		}
	}
}
function post_player_modifiers()
{
	//if live_call() return live_result;
	
	with obj_persistent
	{
		if MOD.JohnGhost
		{
			if !instance_exists(obj_exitgate) && !instance_exists(obj_hungrypillar) && !instance_exists(obj_lapportal)
			&& room != timesuproom && room != rank_room && !instance_exists(obj_treasure)
			{
				var xx = obj_player1.x, yy = obj_player1.y;
		
				if yy > room_height / 2
					yy = room_height + 200;
				else
					yy = -200;
				if xx > room_width / 2
					xx += 100;
				else
					xx -= 100;
		
				instance_create_unique(xx, yy, obj_ghostfollow);
			}
		}
		
		if MOD.GreenDemon
		{
			with obj_player1
				instance_create_unique(x, y, obj_greendemon);
		}
		with obj_greendemon
		{
			if state != -2
			{
				x = obj_player1.x;
				y = obj_player1.y;
				xstart = x;
				ystart = y;
				state = -1;
			}
		}
		
		if MOD.CosmicClones
		{
			with obj_player1
				instance_create_unique(x, y, obj_cosmicclone);
		}
	}
}
