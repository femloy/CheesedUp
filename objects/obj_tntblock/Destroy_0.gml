if !in_saveroom()
{
	scr_rockblock_tag();
	instance_create(x + sprite_width / 2, y + sprite_height / 2, obj_playerexplosion);
	
	with obj_rockblock
	{
		if distance_to_object(other) <= 1
			alarm[1] = 8;
	}
	
	repeat 6
		create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_tntblockdebris);
	add_saveroom();
}
