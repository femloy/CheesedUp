/// @func draw_save_state
/// @desc	Saves the current state of drawing
/// @return  {struct.DrawState}
function draw_save_state()
{
	gpu_push_state();
	
	return {
		shader : shader_current(),
		color : draw_get_color(),
		alpha : draw_get_alpha(),
		font : draw_get_font(),
		valign : draw_get_valign(),
		halign : draw_get_halign(),
		world_matrix : matrix_get(matrix_world)
	};
}
