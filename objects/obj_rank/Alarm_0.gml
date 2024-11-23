if SUGARY_SPIRE && sugary
	destroy_sounds([sugaryrank]);

if do_wait
	continue_state = 1;
else
	event_user(0);
