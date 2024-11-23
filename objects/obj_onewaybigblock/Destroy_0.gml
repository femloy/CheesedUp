if (room == rm_editor)
	exit;
if !in_saveroom()
{
	if !SUGARY
	{
		if particlespr != noone
		{
			repeat 8
			{
				with create_debris(x + random_range(0, 64), y + random_range(0, 64), particlespr, true)
				{
					hsp = random_range(-5, 5);
					vsp = random_range(-10, 10);
					image_speed = 0;
				}
			}
			scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
		}
		if deadspr != noone
		{
			with instance_create(x + 32 * (REMIX ? image_xscale : 1), y + 32, obj_sausageman_dead)
			{
				sprite_index = other.deadspr;
				if REMIX
					image_xscale = other.image_xscale;
			}
			sound_play_3d("event:/sfx/enemies/killingblow", x, y);
		}
	}
	else if SUGARY
	{
		repeat (7)
			create_debris(x + image_xscale * 32, y + 32, spr_bigdebris_ss)

		create_debris(x + image_xscale * 64, y + 32, spr_bigdebrisBandage)
		scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	}
	scr_sleep(5);
	add_saveroom();
}
instance_destroy(solid_inst);
