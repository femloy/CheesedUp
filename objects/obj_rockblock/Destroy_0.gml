if !in_saveroom()
{
	with obj_rockblock
	{
		if distance_to_object(other) <= 1
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	with obj_destructiblerockblock
	{
		if distance_to_object(other) <= 1
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	sound_play_3d("event:/sfx/misc/rockbreak", x + sprite_width / 2, y + sprite_height / 2);
	repeat 7
		create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_rockdebris);
	add_saveroom();
}
