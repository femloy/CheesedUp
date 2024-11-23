if !YYC
	message = "don't steal my code shithead";

function cyop_music()
{
	if live_call() return live_result;
	
	music = noone;
	if current_custom != noone
	{
		var song = custom_music[current_custom];
		if song.instance == noone
		{
			if song.fmod
			{
				song.instance = fmod_event_create_instance(song.event);
				fmod_event_instance_set_parameter(song.instance, "state", song.state, false);
				fmod_event_instance_set_parameter(song.instance, "hub", song.state, false);
				fmod_event_instance_play(song.instance);
			}
			else
				song.instance = audio_play_sound(song.event, 0, true, cyop_make_volume());
		}
	}
	for(var i = 0; i < array_length(custom_music); i++)
	{
		var song = custom_music[i];
		if song.instance == noone
			continue;
		
		if song.fmod
		{
			if song.fadespeed >= 0
			{
				fmod_event_instance_set_paused(song.instance, false);
				song.paused = false;
				song.volume = 0;
			}
			else
			{
				fmod_event_instance_set_paused(song.instance, true);
				song.paused = true;
				song.volume = 1;
			}
		}
		else if song.volume > 0 or song.fadespeed >= 0
		{
			if song.fadespeed > 0
				song.volume = Approach(song.volume, 1, song.fadespeed);
			else if song.fadespeed < 0
				song.volume = Approach(song.volume, 0, abs(song.fadespeed));
			else
				song.volume = 1;
			
			audio_sound_gain(song.instance, cyop_make_volume() * song.volume, 0);
			if audio_is_paused(song.instance)
				audio_resume_sound(song.instance);
		}
	}
}
function cyop_freemusic()
{
	if live_call() return live_result;
	
	with obj_music
	{
		current_custom = noone;
		custom_panic = -1;
		
		while array_length(custom_music) > 0
		{
			var i = array_pop(custom_music);
			if i.fmod
			{
				fmod_event_instance_stop(i.instance, true);
				fmod_event_instance_release(i.instance);
			}
			else
				audio_stop_sound(i.instance);
			delete i;
		}
	}
}
function cyop_make_volume()
{
	if live_call() return live_result;
	
	var volume = 0.75;
	volume *= 1 - fmod_get_parameter("totem", false) * 0.5;
	volume *= 1 - fmod_get_parameter("pillarfade", false);
	return global.option_music_volume * clamp(volume, 0, 1);
}
function cyop_switch_song(index, fade)
{
	if live_call(index, fade) return live_result;
	
	if index == noone
		exit;
	
	with obj_music
	{
		if current_custom != noone && index != current_custom
			custom_music[current_custom].fadespeed = -fade;
		
		current_custom = index;
		custom_music[current_custom].fadespeed = fade;
	}
}
function cyop_add_song(song, fade)
{
	if live_call(song, fade) return live_result;
	
	var state = 0, fmod = string_starts_with(song, "event:");
	if fmod && string_pos(".", song) != 0
	{
		/*
			event:/music/w1/ruin.1
			the end part (.1) is the state
		*/
		var split = string_split(song, ".", true, 1);
		song = split[0];
		state = real(split[1]);
	}
	if fmod
	{
		song = string_replace(song, "/music/soundtest/", "/soundtest/base/");
		song = string_replace(song, "/mod-music/editormusic", "/modded/editor"); // AFOM 2.0
	}
	
	var event = fmod ? song : cyop_resolvevalue(song, "sound");
	if !fmod && is_string(event)
		return noone;
	
	with obj_music
	{
		var found = -1;
		for(var i = 0; i < array_length(custom_music); i++)
		{
			if custom_music[i].event == event
			{
				found = i;
				break;
			}
		}
		if found < 0
		{
			found = array_length(custom_music);
			array_push(custom_music, {event: event, instance: noone, fmod: fmod, state: state, paused: false, volume: fade > 0 ? 0 : 1, fadespeed: fade});
		}
		return found;
	}
}
