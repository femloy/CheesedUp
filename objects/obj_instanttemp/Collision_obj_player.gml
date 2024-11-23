instance_destroy(obj_iceblock);
instance_destroy(obj_iceblockslope);
if (sprite_index != spr_heater2)
{
	sound_play("event:/sfx/misc/breakicebig");
	scr_fmod_soundeffect(snd, x, y);
	sprite_index = spr_heater2;
	if !in_saveroom()
        add_saveroom();
}
