if sprite_index == spr_playerN_move
{
	pal_swap_set(spr_noisepalette, 1);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();
