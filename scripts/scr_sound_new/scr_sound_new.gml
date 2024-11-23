/// @func sound_stop_all([force])
/// @desc Completely kills all sounds
function sound_stop_all(force = true)
{
	audio_stop_all();
	stop_music();
	// TODO
}

/// @func sound_create_instance(event)
/// @desc Creates an instance of an FMOD event
function sound_create_instance(event)
{
	if is_string(event)
		return fmod_event_create_instance(event);
	else if is_handle(event) && audio_exists(event)
	{
		var snd = audio_play_sound(event, 0, false, 0);
		audio_stop_sound(snd);
		return snd;
	}
}

/// @func sound_destroy_instance(event)
/// @desc Destroys an instance of an FMOD event
function sound_destroy_instance(inst)
{
	if inst == noone
		exit;
	
	if is_handle(inst) && audio_exists(inst)
		audio_stop_sound(inst);
	else
		fmod_event_instance_release(inst);
}

/// @func sound_pause_all(enable, [excludeEventID])
/// @desc Pauses all sounds
function sound_pause_all(enable, excludeEventID = -1)
{
	if enable
		audio_pause_all();
	else
		audio_resume_all();
	
	if excludeEventID == -1
		fmod_event_instance_set_paused_all(enable);
	else
		fmod_event_instance_set_paused_all_exclude(enable, excludeEventID);
}

/// @func sound_stop(inst, [force])
/// @desc Stops playing the given sound
function sound_stop(inst, force = true)
{
	if inst == noone
		exit;
	if is_string(inst)
		return false;
	
	/*if is_string(inst)
	{
		var index = fmod_event_instance_get_index(inst);
		return index == noone ? false : fmod_event_instance_stop(index, force);
	}
	else */if is_handle(inst) && audio_exists(inst)
		audio_stop_sound(inst);
	else
		fmod_event_instance_stop(inst, force)
}

/// @func sound_is_playing(inst)
/// @desc Checks if the given sound is playing
function sound_is_playing(inst)
{
	if inst == noone
		return false;
	if is_string(inst)
		return false;
	
	/*
	if is_string(inst)
	{
		var index = fmod_event_instance_get_index(inst);
		return index == noone ? false : fmod_event_instance_is_playing(index);
	}
	else */if is_handle(inst) && audio_exists(inst)
		return audio_is_playing(inst);
	else
		return fmod_event_instance_is_playing(inst);
}

/// @func sound_play(event)
/// @desc Plays a non-3D event or instance
function sound_play(event) 
{
	sound_play_3d(event);
}

/// @func sound_play_3d(event, [x], [y])
/// @desc Plays a 3D event or instance with the given position
function sound_play_3d(event, xx = undefined, yy = undefined)
{
	if event == noone or event == ""
		exit;
	if MOD.Mirror && xx != undefined
		xx = room_width - xx;
	
	if is_string(event)
	{
		// ONE SHOT.
		if xx != undefined && yy != undefined
			return fmod_event_one_shot_3d(event, xx, yy)
		else
			return fmod_event_one_shot(event)
	}
	else
	{
		if is_handle(event) && audio_exists(event)
			return audio_play_sound(event, 0, false, global.option_sfx_volume * global.option_master_volume);
		
		// INSTANCE.
		//fmod_event_instance_set_paused(event, false);
		if xx != undefined && yy != undefined
			sound_instance_move(event, xx, yy);
		fmod_event_instance_play(event);
		return event;
	}
	return noone;
}

/// @func sound_play_centered(event)
/// @desc Plays a 3D event in the center
function sound_play_centered(event) {
	return sound_play_3d(event, CAMX + SCREEN_WIDTH / 2, CAMY + SCREEN_HEIGHT / 2);
}

/// @func sound_instance_move(inst, xx, yy)
/// @desc Moves the position of a sound
function sound_instance_move(inst, xx, yy)
{
	if inst == noone
		return false;
	
	if MOD.Mirror
		xx = room_width - xx;
	fmod_event_instance_set_3d_attributes(inst, xx, yy);
}
