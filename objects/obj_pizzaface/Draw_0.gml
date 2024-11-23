live_auto_call;

if flash
	draw_set_flash();
var alpha = sprite_index == spr_pizzaface_spawn ? 1 : image_alpha;
draw_sprite_ext(sprite_index, image_index, x + offsetx, y + offsety, image_xscale, image_yscale, image_angle, image_blend, alpha);
draw_reset_flash();
