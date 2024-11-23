live_auto_call;

condition = function()
{
	player = instance_place(x, y, obj_player);
	return player && player.state != states.chainsaw && global.panic;
}
target = obj_softlocktarget;
state = 0;
player = obj_player1;
snd = fmod_event_create_instance("event:/sfx/misc/mrstickhat");
handy = 0;
handx = 0;
storedimagespeed = 0;
image_speed = 0.35;
