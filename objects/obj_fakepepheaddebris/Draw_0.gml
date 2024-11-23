pal_swap_player_palette(,,,,,true);
draw_self();
pal_swap_reset();

if clone
{
	pal_swap_set(spr_peppalette, 13, false);
	draw_self();
}
