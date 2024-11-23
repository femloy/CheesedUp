image_alpha = 0.6;
alarm[0] = 1;
player = obj_player1.id;
direction = point_direction(x, y, player.x, player.y);
speed = 3;
image_speed = 0.35;
snd = fmod_event_create_instance("event:/sfx/vigilante/ghostloop");

if instance_exists(obj_vigilanteboss) && obj_vigilanteboss.snotty
{
	sprite_index = spr_johnesnot;
	image_alpha = 1;
}
else
	fmod_event_instance_play(snd);
