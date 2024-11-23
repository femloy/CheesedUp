if obj_player1.character != "N"
{
	pal_swap_player_palette(,,,,, true);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();
