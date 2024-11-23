/// @func	draw_remove_bounds()
/// @desc	Removes the bounds if one is present, returns false if shaders aren't supported or you don't have a clip shader set, returns true otherwise
/// @returns	{bool}
function draw_remove_bounds()
{
	if global.performance || (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
		return false;
	shader_set_uniform_f(shader_get_uniform(shader_current(), "u_dorectclip"), 0.0);
	return true;
}