if (noshake == 0)
{
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	shake_camera(3, 3 / room_speed);
	instance_create(x, y, obj_bangeffect);
	with (create_debris(x, y, sprite_index, false))
	{
		image_index = 1;
		image_yscale = -1;
	}
}
fmod_event_instance_stop(snd, true);
fmod_event_instance_release(snd);
