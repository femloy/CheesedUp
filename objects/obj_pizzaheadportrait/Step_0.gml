image_speed = 0.35;
if (floor(image_index) == image_number - 1 && sprite_index == bouncespr)
	sprite_index = idlespr;
mask_index = spr_pizzahead_TVprojectile;
if (move)
{
	if (!grabbed && !ratgrabbed && !thrown)
	{
		hsp = dir * spd;
		if (check_solid(x, y + 1) && vsp > 0)
		{
			if (bounce > 0)
			{
				sound_play_3d("event:/sfx/pizzahead/tvbounce", x, y);
				vsp = -18;
				sprite_index = bouncespr;
				image_index = 0;
				bounce--;
				shake_camera(3, 5 / room_speed);
			}
			else
			{
				instance_destroy(id, false);
				with (create_debris(x, y, spr_pizzahead_tvdebris))
					image_index = 0;
				with (create_debris(x, y, spr_pizzahead_tvdebris))
					image_index = 1;
				with (create_debris(x, y, spr_pizzahead_tvdebris))
					image_index = 2;
				if REMIX
					scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
				move = false;
				hsp = 0;
				alarm[0] = 150;
			}
		}
		if (check_solid(x + sign(hsp), y))
		{
			sound_play_3d("event:/sfx/pep/bumpwall", x, y);
			dir *= -1;
			hsp *= -1;
		}
	}
}
if (grabbed)
	hasgrabbed = true;
if (grabbed || vsp > 0)
	land = true;
if (land)
	depth = 0;
event_inherited();
