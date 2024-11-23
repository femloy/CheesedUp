image_speed = 0.35;
state = states.normal;
idle = 0;
init_collision();
arrowID = noone;
drawing = false;
money_y = 0;

noisette = false;
spr_helicopter = spr_stick_helicopter;
kiss_snd = fmod_event_create_instance("event:/sfx/noisette/kiss");
if (obj_player1.character == "N" || global.swapmode)
{
	sprite_index = spr_noisettestick_idle;
	noisette = true;
	spr_helicopter = spr_noisettestick_helicopter;
}
