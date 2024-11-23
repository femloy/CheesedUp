if (cigar == 1)
{
	pal_swap_set(spr_sausageman_palette, 1, false);
	draw_self();
	shader_reset();
}
else
	draw_self();

if (flash)
{
	draw_set_flash();
	draw_self();
	draw_reset_flash();
}
