pal_swap_player_palette(,,,,, spr_sign != spr_noisesign);
if sprite_index == switchend && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall
	draw_sprite_ext(switchstart, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else if visible
	draw_self();
pal_swap_reset();
