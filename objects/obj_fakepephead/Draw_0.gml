pal_swap_player_palette(,,,,, true);
draw_self();

if clone
{
	pattern_reset();
	cuspal_reset();
	pal_swap_set(spr_peppalette, 13, false);
	draw_self();
}
pal_swap_reset();
