if sprite_index != spr_idle && sprite_index != spr_outline
{
	if sprite_index == spr_pizzaportalendV2
		draw_sprite_ext(spr_pizzaportalendV1, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
	pal_swap_player_palette();
	draw_self();
	pal_swap_reset();
}
else if sprite_index == spr_outline
	draw_sprite_ext(sprite_index, image_index, x, y + Wave(-2, 2, 1, 5), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
{
	draw_self();
	if !(SUGARY_SPIRE && sugary)
	{
		if !global.lap
			lang_draw_sprite(time_attack ? spr_timeattackwarning : spr_lap2warning, 0, x, y + Wave(-5, 5, 0.5, 5));
		else if check_lap_mode(lapmodes.laphell)
			lang_draw_sprite(global.laps >= 2 ? spr_lap4warning : spr_lap3warning, 0, x, y + Wave(-5, 5, 0.5, 5));
		else
			lang_draw_sprite(spr_lap2warning, 1, x, y + Wave(-5, 5, 0.5, 5));
	}
}
