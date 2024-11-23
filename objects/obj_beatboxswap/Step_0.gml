scr_collide();
sound_instance_move(snd, x, y);
if obj_swapmodefollow.sprite_index != obj_swapmodefollow.spr_breakdance
{
	instance_create(x, y, obj_genericpoofeffect);
	instance_destroy();
}
