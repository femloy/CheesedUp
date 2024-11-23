/// @func	draw_set_bounds(left, top, right, bottom, alpha_fix, simple, inverse)
/// @desc	Sets the current shader to the rectclip shader, returns false if shaders aren't supported, returns true otherwise
/// @arg	{real}	left	Left side of the clip region
/// @arg	{real}	top	Top side of the clip region
/// @arg	{real}	right	Right side of the clip region
/// @arg	{real}	bottom	Bottom side of the clip region
/// @arg	{bool}	alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @arg	{bool}	simple			Use the simple version of the shader, enable this for your "draw_circle"/"draw_ellipse"/"draw_rectangle"/"draw_triangle" functions
/// @arg	{bool}	inverse		Simulate the alphafix to all pixels inside the clip
/// @returns	{bool}
function draw_set_bounds(_left, _top, _right, _bottom, _alpha_fix = false, _simple = false, _inverse = false)
{
	if global.performance
		return false;
	if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
	{
		var shader = _simple ? shd_masterclip_basic : shd_masterclip;
		shader_set(shader);
	}
	shader = shader_current();
	
	var clip_bounds_pos = shader_get_uniform(shader, "u_clip_bounds");
	var alphafix_pos = shader_get_uniform(shader, "u_rect_alphafix");
	var inverse_pos = shader_get_uniform(shader, "u_rect_inverse");
	
	if !_alpha_fix
		gpu_set_blendmode(bm_normal);
	else
		reset_blendmode();
	
	shader_set_uniform_f(shader_get_uniform(shader, "u_dorectclip"), 1.0);
	shader_set_uniform_f(clip_bounds_pos, _left, _top, _right, _bottom);
	shader_set_uniform_f(alphafix_pos, _alpha_fix ? 1.0 : 0.0);
	shader_set_uniform_f(inverse_pos, _inverse ? 1.0 : 0.0);
	return true;
}