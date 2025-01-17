if sprite_index != spr_idle && sprite_index != spr_outline
{
	if sprite_index == spr_pizzaportalendV2
		draw_sprite_ext(spr_pizzaportalendV1, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
	pal_swap_player_palette();
	draw_self();
	pal_swap_reset();
}
else if sprite_index == spr_outline or sprite_index == spr_gone
	draw_sprite_ext(sprite_index, image_index, x, y + Wave(-2, 2, 1, 5), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
{
	draw_set_color(c_white);
	draw_self();
	
	var xx = x, yy = y + Wave(-5, 5, 0.5, 5);
	if time_attack
		lang_draw_sprite(spr_timeattackwarning, 0, xx, yy);
	else if !(SUGARY_SPIRE && sugary)
	{
		if !global.lap
			lang_draw_sprite(spr_lap2warning, 0, xx, yy);
		else if check_lap_mode(LAP_MODES.laphell)
			lang_draw_sprite(global.laps >= 2 ? spr_lap4warning : spr_lap3warning, 0, xx, yy);
		else
			lang_draw_sprite(spr_lap2warning, 1, xx, yy);
	}
}
