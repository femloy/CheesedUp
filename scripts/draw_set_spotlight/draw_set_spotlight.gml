/// @func	draw_set_spotlight(origin_x, origin_y, clip_radius, alphafix, simple, inverse)
/// @desc	Sets the current shader to the circleclip shader, returns false if shaders aren't supported, returns true otherwise
/// @arg	{real}	origin_x	X-Position of the circle clip
/// @arg	{real}	origin_y	Y-Position of the circle clip
/// @arg	{real}	clip_radius	The radius of the clip in pixels
/// @arg	{bool}	alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @arg	{bool}	simple			Use the simple version of the shader, enable this for your "draw_circle"/"draw_ellipse"/"draw_rectangle"/"draw_triangle" functions
/// @arg	{bool}	inverse		Inverses the clip region
/// @returns	{bool}
function draw_set_spotlight(_origin_x, _origin_y, _clip_radius, _alpha_fix = false, _simple = false, _inverse = false)
{
	if global.performance
		return false;
	if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
	{
		var shader = _simple ? shd_masterclip_basic : shd_masterclip;
		shader_set(shader);
	}
	shader = shader_current();
	
	var origin_pos = shader_get_uniform(shader, "u_origin");
	var radius_pos = shader_get_uniform(shader, "u_radius");
	var alphafix_pos = shader_get_uniform(shader, "u_circle_alphafix");
	var inverse = shader_get_uniform(shader, "u_circle_inverse");
	
	if !_alpha_fix
		gpu_set_blendmode(bm_normal);
	else
		reset_blendmode();
	
	shader_set_uniform_f(shader_get_uniform(shader, "u_docircleclip"), 1.0);
	shader_set_uniform_f(origin_pos, _origin_x, _origin_y);
	shader_set_uniform_f(radius_pos, _clip_radius);
	shader_set_uniform_f(alphafix_pos, _alpha_fix ? 1.0 : 0.0);
	shader_set_uniform_f(inverse, _inverse ? 1.0 : 0.0);
	return true;
}
