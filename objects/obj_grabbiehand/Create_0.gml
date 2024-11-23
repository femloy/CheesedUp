image_speed = 0.35;
init_collision();
state = states.normal;
stunned = 0;
turnspeed = 0.5;
shootdir = 0;
fake = false;
reverse = false;
snd = fmod_event_create_instance("event:/sfx/misc/mrstickhat");
