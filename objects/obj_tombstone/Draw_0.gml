draw_self();
if (!unpickable && grounded && !check_solid(x, y))
	draw_sprite_ext(spr_grabicon, image_index, x - (2 * image_xscale), y - 30, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
