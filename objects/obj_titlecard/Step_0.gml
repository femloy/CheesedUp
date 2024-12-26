live_auto_call;

if DEBUG
{
	if keyboard_check_pressed(ord("R"))
	{
		var m = title_music;
		if title_musicID != noone
		{
			destroy_sounds([title_musicID]);
			title_musicID = noone;
		}
		event_perform(ev_create, 0);
		title_music = m;
	}
}

if !fadein
{
	fadealpha = Approach(fadealpha, 1, 0.1);
	if fadealpha >= 1
	{
		fadein = true;
		start = true;
		music = false;
		
		if title_music == "event:/music/w3/golftitle" && obj_player1.character == "V"
			vigigolf = true;
		else
		{
			alarm[0] = 180;
			if title_music == "event:/music/secretworldtitle"
				alarm[0] = 240;
		}
	}
}
else if !IT_skip_titlecard()
{
	fadealpha = Approach(fadealpha, 0, 0.1);
	if vigigolf
	{
		switch vigigolf_con
		{
			case 0:
				alarm[2] = -1;
				
				vigigolf_t += 1;
				if vigigolf_t >= 30
				{
					vigigolf_con = 1;
					sound_play_centered("event:/sfx/vigilante/throw");
					
					vigigolf_t = 0;
				}
				break;
			
			case 1:
				vigigolf_t = lerp(vigigolf_t, 40, lerp(0.1, 0.15, vigigolf_t / 40));
				if vigigolf_t >= 39
				{
					vigigolf_t = 0;
					vigigolf_con = 2;
					sound_play_centered(sfx_explosion);
					screen_shake = 15;
					
					for(var i = 0; i < sprite_get_number(spr_titlecardgolfdebris); i++)
					{
						array_push(particles, {
							type: 0,
							img: i,
							x: 0,
							y: 0,
							hsp: random_range(-15, 15),
							vsp: random_range(-5, -10)
						});
					}
					
					array_push(particles, {
						type: 1,
						img: 0,
						x: 960 / 2,
						y: 540 / 2
					});
				}
				break;
			
			case 2:
				if vigigolf_t % 6 == 5 && !music
				{
					var f = sound_play_3d(sfx_explosion, CAMX + SCREEN_WIDTH / 2 + random_range(600, 900) * choose(-1, 1), CAMY + SCREEN_HEIGHT / 2);
					fmod_event_instance_set_volume(f, 1);
					
					array_push(particles, {
						type: 1,
						img: 0,
						x: random_range(0, 960),
						y: random_range(0, 540)
					});
				}
				
				vigigolf_t += 1;
				if vigigolf_t >= 40 && !music
				{
					music = true;
					
					title_musicID = fmod_event_create_instance("event:/music/w3/golftitle");
					fmod_event_instance_set_parameter(title_musicID, "state", 2, true);
					fmod_event_instance_play(title_musicID);
					
					alarm[0] = 180;
				}
				break;
		}
	}
	else
	{
		if fadealpha <= 0 && !music && title_music != noone
		{
			music = true;
			if global.jukebox == noone
			{
				if is_string(title_music)
				{
					title_musicID = fmod_event_create_instance(title_music);
				
					var _s = 0;
					switch obj_player1.character
					{
						case "N": _s = 1; break;
						case "V": _s = 2; break;
					}
			
					fmod_event_instance_set_parameter(title_musicID, "state", _s, true);
					fmod_event_instance_play(title_musicID);
				}
				else if audio_exists(title_music)
					audio_play_sound(title_music, 0, false, global.option_sfx_volume * global.option_master_volume);
			}
		}
	}
}
if title_musicID != noone && is_holiday(holiday.loy_birthday)
{
	fmod_event_instance_set_pitch(title_musicID, lerp(0.1, 1.4, alarm[0] / 180));
	if alarm[0] <= 0
		fmod_event_instance_stop(title_musicID, true);
}
