init_collision();
steppy = false;
depth = -4;
snd = fmod_event_create_instance("event:/sfx/hub/gusrun");
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff");
sound_instance_move(sniffsnd, x, y);
