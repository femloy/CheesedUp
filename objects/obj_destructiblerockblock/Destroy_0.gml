if !in_saveroom()
{
	scr_rockblock_tag();
	sound_play_3d("event:/sfx/misc/breakblock", x, y);
	
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
	
	instance_create(x + sprite_width / 2, y + sprite_height / 2, obj_bangeffect);
	repeat 7
		create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_rockdebris);
	add_saveroom();
}
