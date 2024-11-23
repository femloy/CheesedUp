if use_palette
{
	pal_swap_player_palette(,,,,, true);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();
