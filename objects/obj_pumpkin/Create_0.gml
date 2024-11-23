depth = 10;
image_speed = 0.35;
active = true;
visibleradius = 200;
soundradius = 400;
trickytreat = false;

snd = fmod_event_create_instance("event:/sfx/misc/halloweenpumpkin");
fmod_event_instance_play(snd);
sound_instance_move(snd, x, y);

// AFOM
cyop = instance_exists(obj_cyop_loader);
seasonal = false;
