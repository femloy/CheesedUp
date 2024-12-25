with instance_create(x, y, obj_sausageman_dead)
{
	sprite_index = other.sprite_index;
	image_index = other.image_index;
	image_speed = 0;
}
scr_sleep(5);

var b = scr_sound_multiple(sfx_stompenemy, x, y);
fmod_event_instance_set_pitch(b, random_range(0.8, 1.2));
fmod_event_instance_set_volume(b, random_range(0.6, 0.8));
