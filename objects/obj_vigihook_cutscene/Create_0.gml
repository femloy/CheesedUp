live_auto_call;

state = 0;
timer = 0;
johne = {x: room_width, y: 0, hsp: 0, vsp: 0};
hook = {x: 0, y: 0, hsp: 0, vsp: 0};
image_speed = 0.35;

snd = fmod_event_create_instance("event:/sfx/vigilante/ghostloop");
fmod_event_instance_play(snd);
