sound_play_3d(sfx_killenemy, x, y);
instance_create(x, y, obj_bangeffect);

with instance_create(x, y, obj_sausageman_dead)
{
	image_xscale = other.image_xscale;
	sprite_index = spr_ghostshroom_dead;
}
add_saveroom();
