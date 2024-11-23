if !in_saveroom()
{
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	repeat 6
		create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_glasspiece, false);
	add_saveroom();
}
