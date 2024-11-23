if !sprite_exists(sprite_index)
	exit;

draw_self();
if sprite_index == spr_pepclone_death && global.stylethreshold >= 3
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 2, false);
	draw_self();
	pal_swap_reset();
}
