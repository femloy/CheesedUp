if !sprite_exists(sprite_index)
	exit;

var d = get_dark(image_blend, obj_drawcontroller.use_dark);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, d, image_alpha);

if !(SUGARY_SPIRE && sugary) && drop && dropstate != states.normal
	draw_sprite(handsprite, handindex, x, hand_y);
