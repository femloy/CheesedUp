live_auto_call;

init_collision();
grav = 0;
playerid = obj_player1;
state = 0;
buffer = 8;
enemyid = noone;

hsp_store = 0;
vsp_store = 0;

hitsnd = fmod_event_create_instance("event:/sfx/enemies/killingblow");
fmod_event_instance_set_pitch(hitsnd, 2);

throwsnd = fmod_event_create_instance("event:/sfx/playerN/airspin");
fmod_event_instance_play(throwsnd);

pullsnd = fmod_event_create_instance("event:/sfx/noise/jetpackloop");
fmod_event_instance_set_pitch(pullsnd, 1.2);

sound_play_3d(sfx_dive, x, y);
depth = -6;
