with (instance_create(x, y, obj_sausageman_dead))
{
	sprite_index = other.sprite_index == spr_johnesnot ? spr_johnesnot_dead : spr_johnecheese_dead;
	if other.sprite_index != spr_johnesnot
		image_alpha = 0.5;
}
with (obj_johnecheese_spawner)
	alarm[0] = spawnmax;
trace(snd);
fmod_event_instance_stop(snd, true);
fmod_event_instance_release(snd);
