function log_source(reason = "")
{
	/*
	try
	{
		var current_event = "Unknown", current_number = event_number;
		switch event_type
		{
			case ev_create: current_event = "Create"; break;
			case ev_destroy: current_event = "Destroy"; break;
			case ev_step: current_event = "Step"; break;
			case ev_alarm: current_event = "Alarm"; break;
			case ev_keyboard: current_event = "Keyboard"; break;
			case ev_keypress: current_event = "KeyPress"; break;
			case ev_keyrelease: current_event = "KeyRelease"; break;
			case ev_mouse: current_event = "Mouse"; break;
			case ev_collision: current_event = "Collision"; current_number = object_get_name(current_number); break;
			case ev_other: current_event = "Other"; break;
			case ev_gesture: current_event = "Gesture"; break;
			case ev_draw: current_event = "Draw"; break;
		}
		trace($"[YOU FUCKED UP!] object: {object_get_name(object_index)} event: {current_event}_{current_number} reason: {reason}");
	}
	catch (e)
	{
		trace($"[YOU FUCKED UP!] reason: {reason} stacktrace: {e.stacktrace}");
	}
	*/
	//trace($"[Stacktrace] {reason} - {debug_get_callstack()}");
}
