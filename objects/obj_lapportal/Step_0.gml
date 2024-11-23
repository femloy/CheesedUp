if (global.panic or instance_exists(obj_wartimer) or time_attack) && sprite_index != spr_outline
{
	image_alpha = 1;
	if sprite_index == spr_idle
	{
		playerid = noone;
		with (obj_player)
		{
			if instance_exists(obj_genericdeath)
				break;
			
			if (other.playerid == noone && place_meeting(x, y, other))
			{
				sound_play_3d("event:/sfx/misc/secretenter", x, y);
				with obj_camera
					lock = true;
				state = states.actor;
				visible = false;
				other.sprite_index = other.spr_enter;
				other.image_index = 0;
				other.playerid = id;
				
				if SUGARY_SPIRE && other.sugary
					sound_play_3d("event:/modded/sfx/secretenterSP", x, y);
				else
					sound_play_3d("event:/sfx/misc/lapenter", x, y);
				
				if !other.time_attack
				{
					var collect = 3000;
					if check_lap_mode(lapmodes.laphell) && !global.in_afom
					{
						if global.laps == 1
							collect = 6000;
						if global.laps >= 2
							collect = 10000;
					}
					else if check_lap_mode(lapmodes.infinite) && !instance_exists(obj_wartimer) && global.lap
						global.fill += global.leveltosave == "exit" ? 360 : 180;
				
					if global.leveltosave == "exit" && !global.lap
						global.fill += calculate_panic_timer(2, 30);
					if SUGARY_SPIRE
					{
						if global.leveltosave == "sucrose" && !global.lap
							global.fill += calculate_panic_timer(1, 30);
					}
					if global.leveltosave == "sucrose" or global.leveltosave == "war"
						global.stylelock = true;
				
					if DEATH_MODE
					{
						if MOD.DeathMode with obj_deathmode
							time_fx += 30;
					}
				
					if !in_saveroom(other.id)
					{
						//ds_list_add(global.saveroom, other.id);
						global.collect += collect;
						global.combotime = 60;
						with instance_create(x, y, obj_smallnumber)
							number = string(collect);
					}
				
					if global.in_afom
					{
						with obj_persistent
							alarm[0] = -1;
						global.lap4time = max((other.warmin * 60) + other.warsec, 0);
					}
				}
				else
					global.combotime = 60;
			}
		}
	}
	else if (sprite_index == spr_enter)
	{
		with (playerid)
		{
			hsp = 0;
			vsp = 0;
			visible = false;
		}
		if (floor(image_index) == (image_number - 1))
		{
			image_index = image_number - 1;
			image_speed = 0;
			
			if !instance_exists(obj_fadeout)
			{
				if time_attack
				{
					with playerid
					{
						targetDoor = "TIMED";
						targetRoom = exitgate_room;
					}
					with instance_create(0, 0, obj_fadeout)
						roomreset = true;
				}
				else
				{
					with playerid
					{
						targetDoor = "LAP";
						targetRoom = other.targetRoom;
					}
					for (var i = 0; i < ds_list_size(global.escaperoom); i++)
					{
						var b = ds_list_find_value(global.escaperoom, i);
						var q = ds_list_find_index(global.baddieroom, b);
						var t = false;
						if (q == -1)
						{
							q = ds_list_find_index(global.saveroom, b);
							t = true;
						}
						if (q != -1)
						{
							if (!t)
								ds_list_delete(global.baddieroom, q);
							else
								ds_list_delete(global.saveroom, q);
						}
					}
					global.laps++;
					global.lap = true;
					instance_create(0, 0, obj_fadeout);
				
					if global.in_afom
					{
						with obj_music
						{
							if is_string(other.custommusic)
							{
								trace("[Custom Song] ", other.custommusic);
							
								var found = cyop_add_song(other.custommusic, 0);
								custom_panic = found;
								cyop_switch_song(found, 1);
							}
						}
					}
				}
			}
		}
	}
}
else
	image_alpha = 0.5;
