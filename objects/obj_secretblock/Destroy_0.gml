if !in_saveroom()
{
	if SUGARY
	{
		var rep = (4 + ((sprite_width / 32) - 1))
		repeat rep
			with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_debris_ss))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
				image_speed = 0.35;
			}
	}
	else
	{
		repeat (2)
		{
			with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
				image_speed = 0.35;
			}
		}
		if (particlespr == spr_towerblockdebris)
		{
			with (instance_create(x + random_range(0, sprite_width), y + random_range(0, sprite_height), obj_parryeffect))
			{
				sprite_index = spr_deadjohnsmoke;
				image_speed = 0.35;
			}
		}
	}
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
	notification_push(notifs.block_break, [room]);
}
scr_cutoff();
if (is_string(targettiles))
	scr_destroy_tiles(32, targettiles);
else
	scr_destroy_tile_arr(32, targettiles);
scr_destroy_nearby_tiles();
