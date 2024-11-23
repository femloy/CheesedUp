if spr_fall == spr_noisette_fall
	draw_self();
else
{
	pal_swap_player_palette(,,,,, spr_fall != spr_noiseyexit_fall);
	draw_self();
	pal_swap_reset();
}
