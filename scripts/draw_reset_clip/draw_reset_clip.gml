function draw_reset_clip() 
{
	if shader_current() != shd_masterclip_basic
		shader_set(shd_masterclip);
	draw_remove_bounds();
	draw_remove_mask();
	draw_remove_spotlight();
	if event_type == ev_draw && event_number == ev_gui
		reset_shader_fix();
	else
		shader_reset();
}
