/// @func	draw_restire_state(state)
/// @desc	Restores the draw context to the provided state parameter
/// @param	{struct.DrawState}	state
function draw_restore_state(_state)
{
	gpu_pop_state();
	
	shader_set(_state.shader)
	draw_set_color(_state.color);
	draw_set_alpha(_state.alpha);
	draw_set_font(_state.font);
	draw_set_valign(_state.valign);
	draw_set_halign(_state.halign);
	matrix_set(matrix_world, _state.world_matrix);
}
