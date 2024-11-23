if spr_palette != noone
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_palette, paletteselect, false);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();
