if (start)
{
	draw_sprite(bgsprite, bgindex, 0, 0);
	var cy = irandom_range(-shake_mag, shake_mag);
	var img = image_index;
	if sprite_index == spr_taxitransition_pep
	{
		draw_sprite(sprite_index, 0, 0, cy);
		img = 1;
	}
	
	pal_swap_player_palette(sprite_index, img);
	pal_swap_supernoise();
	draw_sprite(sprite_index, img, 0, cy);
	pal_swap_reset();
	
	if (sprite_index == spr_taxitransition_gusN)
	{
		draw_set_alpha(0.3);
		draw_sprite(spr_taxitransition_gusN_shadow, 0, 0, cy);
	}
}

draw_set_alpha(fade);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
