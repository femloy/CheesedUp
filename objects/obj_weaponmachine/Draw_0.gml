live_auto_call;

if sprite_index != spr_weaponmachine_custom && sprite_index != spr_weaponmachine_custom_press
	draw_self();
else if image_index >= 12
	draw_sprite(spr_weaponmachine_custom, image_index, x, y);
else
{
	if image_index >= 11
		draw_set_flash();
	
	draw_set_font(global.smallnumber_fnt);
	draw_set_align(fa_right, fa_middle);
	draw_text(x - 14 + random_range(-shake, shake), y - 8 + random_range(-shake, shake), coins);
	draw_set_align();
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
	draw_sprite(spr_weaponmachine_custom, 0, x + random_range(-shake, shake), y + random_range(-shake, shake));
	draw_sprite(spr_weaponmachine_custom, sprite_index == spr_weaponmachine_custom ? 1 + ((image_index - 3) % 2) : 1, x + random_range(-shake, shake), y + random_range(-shake, shake));
	
	draw_reset_flash();
}
