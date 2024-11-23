if check_char("V")
{
	pal_swap_set(spr_spitcheese_palette, 2);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();