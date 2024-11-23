if new_behavior
{
	if in_saveroom()
		exit;
	
	with instance_create(x + 32, y + 32, obj_sausageman_dead)
		sprite_index = spr_bigdoughblockdead;
	scr_sleep(5);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	add_saveroom();
}
else
{
	with instance_create(x + 32, y + 32, obj_sausageman_dead)
		sprite_index = spr_bigdoughblockdead;
	scr_sleep(5);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	
	with instance_create(x, y, obj_destroyable_respawner)
	{
	    image_xscale = other.image_xscale;
	    image_yscale = other.image_yscale;
	    sprite_index = other.sprite_index;
	    content = other.object_index;
	    spawn_buffer = 70;
	}
}
