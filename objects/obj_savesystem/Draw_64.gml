if showicon
{
	var a = clamp(icon_alpha, 0, 1);
	var spr = spr_pizzaslice;
	if SUGARY_SPIRE && check_sugary()
		spr = spr_collectslice_ss;
	draw_sprite_ext(spr, icon_index, SCREEN_WIDTH - 64, SCREEN_HEIGHT - 60, 1, 1, 0, c_white, a);
}
