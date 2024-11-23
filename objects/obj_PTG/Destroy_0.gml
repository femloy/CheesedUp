if !in_saveroom()
{
	with (instance_create(x, y - 50, obj_parryeffect))
		sprite_index = spr_peppinoteleporteffect;
	sound_play_3d("event:/sfx/misc/teleporterstart", x, y);
	add_saveroom();
}
