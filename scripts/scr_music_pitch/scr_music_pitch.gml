function scr_music_pitch()
{
	if live_call() return live_result;
	
	static music_pitch = 1;
	
	// transfo pitch
	if instance_exists(obj_player1)
	{
		if IT_music_pitch()
		{
			var target_pitch = 1;
		
			var _state = obj_player1.state;
			if _state == states.backbreaker || _state == states.chainsaw
				_state = obj_player1.tauntstoredstate;
			
			switch _state
			{
				case states.knightpep:
					target_pitch = 0.9;
					break;
				
				case states.knightpepslopes:
					target_pitch = 1.2;
					break;
				
				case states.tumble:
					if obj_player1.sprite_index == obj_player1.spr_tumblestart
					or obj_player1.sprite_index == obj_player1.spr_tumble
						target_pitch = 1.2;
					break;
			}
			
			if REMIX
				music_pitch = Approach(music_pitch, target_pitch, 0.01);
			else
				music_pitch = target_pitch;
		}
		else
			music_pitch = 1;
	}
	
	var final_pitch = music_pitch;
	if is_holiday(holiday.loy_birthday)
		final_pitch *= 1.1;
	if room == tower_hubroomE
		final_pitch *= 0.5;
	
	// apply
	if global.jukebox != noone
		fmod_event_instance_set_pitch(global.jukebox.instance, is_holiday(holiday.loy_birthday) ? Wave(0.5, 2, 5, 0) : 1);
	else
	{
		if is_struct(music)
		{
			fmod_event_instance_set_pitch(music.event, final_pitch);
			fmod_event_instance_set_pitch(music.event_secret, final_pitch);
		}
		fmod_event_instance_set_pitch(panicmusicID, final_pitch);
		fmod_event_instance_set_pitch(kidspartychaseID, final_pitch);
		fmod_event_instance_set_pitch(pillarmusicID, final_pitch);
		
		if instance_exists(obj_cyop_loader)
		{
			if current_custom != noone
			{
				var song = custom_music[current_custom];
				if song.instance != noone
				{
					if song.fmod
						fmod_event_instance_set_pitch(song.instance, final_pitch);
					else
						audio_sound_pitch(song.instance, final_pitch);
				}
			}
		}
	}
}