function draw_reset_clip()
{
	draw_clear_mask();
	if draw_remove_spotlight()
		shader_reset();
}
