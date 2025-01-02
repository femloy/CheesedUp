// only include the extension if we're running from the IDE
#macro live_enabled true
#macro live_updating_enabled TESTBUILD
#macro live_auto_call if live_updating_enabled { if live_call() return live_result; }

if live_enabled
{
	// safeguard against making multiple obj_gmlive instances
	if instance_number(obj_gmlive) > 1
	{
		var first = instance_find(obj_gmlive, 0);
		if id != first
		{
			instance_destroy();
			exit;
		}
	}
	
	if TESTBUILD
	{
		if asset_get_index("live_init") == -1
			show_error("live_init is missing!\nEither GMLive is not imported in the project, or the 'GMLive' script got corrupted (try re-importing)\nIf you don't have GMLive, you can safely remove obj_gmlive and any remaining live_* function calls.\n\n", 1);
	}
	
	// change the IP/port here if gmlive-server isn't running on the same device as the game
	// (e.g. when running on mobile platforms):
	live_init(1, !live_updating_enabled ? undefined : "http://localhost:5100", "");
	
	live_blank_object = obj_blank;
	live_blank_room = rm_blank;
	if live_updating_enabled
		live_room_updated = scr_room_updated;
	live_rooms = false;
	
	#region CONSTANTS (BECAUSE GMLIVE SUCKS)
	
	for (var i = 0; sequence_exists(i); i++)
		gml_asset_add(sequence_get(i).name, i);
	
	// File Attribute Constant
	live_constant_add("fa_none", fa_none);
	live_constant_add("fa_readonly", fa_readonly);
	live_constant_add("fa_hidden", fa_hidden);
	live_constant_add("fa_sysfile", fa_sysfile);
	live_constant_add("fa_volumeid", fa_volumeid);
	live_constant_add("fa_directory", fa_directory);
	live_constant_add("fa_archive", fa_archive);
	
	// FMOD
	live_function_add("fmod_event_create_instance(str)", function(str) {
	    return fmod_event_create_instance(str);
	});
	live_function_add("fmod_event_instance_play(inst)", function(inst) {
	    return fmod_event_instance_play(inst);
	});
	live_function_add("fmod_event_instance_stop(inst, ignore_seek)", function(inst, ignore_seek) {
	    return fmod_event_instance_stop(inst, ignore_seek);
	});
	live_function_add("fmod_event_instance_release(inst)", function(inst) {
	    return fmod_event_instance_release(inst);
	});
	live_function_add("fmod_event_instance_set_3d_attributes(inst, x, y)", function(inst, x, y) {
	    return fmod_event_instance_set_3d_attributes(inst, x, y);
	});
	live_function_add("fmod_event_instance_set_parameter(inst, param, value, ignore_seek)", function(inst, param, value, ignore_seek) {
	    return fmod_event_instance_set_parameter(inst, param, value, ignore_seek);
	});
	live_function_add("fmod_event_instance_get_parameter(inst, param, ignore_seek)", function(inst, param, ignore_seek) {
	    return fmod_event_instance_get_parameter(inst, param, ignore_seek);
	});
	live_function_add("fmod_set_parameter(param, value, ignore_seek)", function(param, value, ignore_seek) {
	    return fmod_set_parameter(param, value, ignore_seek);
	});
	live_function_add("fmod_get_parameter(param, ignore_seek)", function(param, ignore_seek) {
	    return fmod_get_parameter(param, ignore_seek);
	});
	live_function_add("fmod_event_instance_set_paused(inst, pause)", function(inst, pause) {
	    return fmod_event_instance_set_paused(inst, pause);
	});
	live_function_add("fmod_event_instance_get_paused(inst)", function(inst) {
	    return fmod_event_instance_get_paused(inst);
	});
	live_function_add("fmod_event_instance_set_paused_all(pause)", function(pause) {
	    return fmod_event_instance_set_paused_all(pause);
	});
	live_function_add("fmod_event_one_shot(event)", function(event) {
	    return fmod_event_one_shot(event);
	});
	live_function_add("fmod_event_one_shot_3d(event, x, y)", function(event, x, y) {
	    return fmod_event_one_shot_3d(event, x, y);
	});
	live_function_add("fmod_event_instance_is_playing(inst)", function(inst) {
	    return fmod_event_instance_is_playing(inst);
	});
	live_function_add("fmod_event_instance_get_timeline_pos(inst)", function(inst) {
	    return fmod_event_instance_get_timeline_pos(inst);
	});
	live_function_add("fmod_event_instance_set_timeline_pos(inst, pos)", function(inst, pos) {
	    return fmod_event_instance_set_timeline_pos(inst, pos);
	});
	live_function_add("fmod_event_get_length(inst)", function(inst) {
	    return fmod_event_get_length(inst);
	});
	live_function_add("fmod_event_instance_set_pitch(inst, pitch)", function(inst, pitch) {
	    return fmod_event_instance_set_pitch(inst, pitch);
	});
	live_function_add("fmod_event_instance_get_pitch(inst, ignore_seek)", function(inst, ignore_seek) {
	    return fmod_event_instance_get_pitch(inst, ignore_seek);
	});
	live_function_add("fmod_event_instance_set_volume(inst, volume)", function(inst, volume) {
	    return fmod_event_instance_set_volume(inst, volume);
	});
	live_function_add("fmod_event_instance_get_volume(inst, ignore_seek)", function(inst, ignore_seek) {
	    return fmod_event_instance_get_volume(inst, ignore_seek);
	});
	live_function_add("fmod_last_result()", function() {
	    return fmod_last_result();
	});
	live_function_add("fmod_bank_unload(bank_index)", function(bank_index) {
	    return fmod_bank_unload(bank_index);
	});
	
	if live_updating_enabled
	{
		live_function_add("launch_external(str)", function(str) {
		    return launch_external(str);
		});
		live_function_add("folder_destroy(path)", function(path) {
		    return folder_destroy(path);
		});
		live_function_add("folder_move(source, dest)", function(source, dest) {
		    return folder_move(source, dest);
		});
		live_function_add("image_get_width(filename)", function(filename) {
		    return image_get_width(filename);
		});
		live_function_add("image_get_height(filename)", function(filename) {
		    return image_get_height(filename);
		});
	}
	
	scr_modding_init();
	
	#endregion
}
else
	instance_destroy();
