image_speed = 0.35;
init_collision();
vsp = -10;
snd = noone;

dead = check_char("V");
if dead
{
	snd = fmod_event_create_instance("event:/sfx/playerN/animatronic");
	fmod_event_instance_play(snd);
	sprite_index = spr_mort_assassinated;
}
