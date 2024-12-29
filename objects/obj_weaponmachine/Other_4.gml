if in_saveroom()
	instance_destroy(id, false);
else
{
	if (coins != 4 or image_xscale != 1 or image_yscale != 1)
	&& sprite_index == spr_weaponmachine
	{
		sprite_index = spr_weaponmachine_custom;
		image_index = 3;
	}
}
