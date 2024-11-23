if !sprite_exists(sprite_index)
	exit;

if REMIX && instance_exists(obj_drawcontroller) && obj_drawcontroller.use_dark
{
	var b = get_dark(image_blend, true);
	if SUGARY
		draw_set_flash(b);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha);
	if SUGARY
		draw_reset_flash();
}
else
	draw_self();
