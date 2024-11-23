function scr_combotitledraw(sprite, x, y, title, index = 0)
{
	var very = 0, draw_frame;
	if SUGARY_SPIRE && sugary
		draw_frame = min(title, 24);
	else
	{
		draw_frame = title * 2 + index;
		while draw_frame >= sprite_get_number(sprite)
		{
			draw_frame -= sprite_get_number(sprite);
			very++;
		}
	}
	if !REMIX
		very = min(very, 1);
	if object_index == obj_combotitle && very > 3
		exit;
	
	lang_draw_sprite_ext(sprite, draw_frame, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
	if (SUGARY_SPIRE && sugary) or very <= 0
		exit;
	
	var xx = x - 65, yy = y - 6;
	repeat very
	{
		xx -= 10;
		yy -= 6;
	}
	
	repeat very
	{
		xx += 10;
		yy += 6;
		lang_draw_sprite_ext(spr_combovery, 0, xx, yy, 1, 1, 0, c_white, image_alpha);
	}
}
