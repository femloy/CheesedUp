if start
{
	var xx = SCREEN_X, yy = SCREEN_Y, xscale = get_screen_xscale(), yscale = get_screen_yscale();
	
	draw_sprite_ext(bgsprite, bgindex, xx, yy, xscale, yscale, 0, c_white, 1);
	var cy = yy + irandom_range(-shake_mag, shake_mag) * yscale;
	var img = image_index;
	
	if sprite_index == spr_taxitransition_pep
	{
		draw_sprite_ext(sprite_index, 0, xx, cy, xscale, yscale, 0, c_white, 1);
		img = 1;
	}
	
	pal_swap_player_palette(sprite_index, img);
	pal_swap_supernoise();
	draw_sprite_ext(sprite_index, img, xx, cy, xscale, yscale, 0, c_white, 1);
	pal_swap_reset();
	
	if sprite_index == spr_taxitransition_gusN
	{
		draw_set_alpha(0.3);
		draw_sprite_ext(spr_taxitransition_gusN_shadow, 0, xx, cy, xscale, yscale, 0, c_white, 1);
	}
}

draw_set_alpha(fade);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
