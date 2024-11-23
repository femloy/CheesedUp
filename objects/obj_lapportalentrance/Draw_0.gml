if sprite_index == spr_pizzaportalentrancestartV2
	draw_sprite_ext(spr_pizzaportalentrancestartV1, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

pal_swap_player_palette();
draw_self();
pal_swap_reset();
