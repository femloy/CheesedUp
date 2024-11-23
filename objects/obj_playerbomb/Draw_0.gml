if obj_drawcontroller.use_dark
	exit;

if obj_player1.spr_palette == spr_noisepalette
	pal_swap_player_palette();
else
	pal_swap_set(spr_noisepalette, 1);
draw_self();
pal_swap_reset();
