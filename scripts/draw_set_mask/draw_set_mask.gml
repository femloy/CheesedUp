/// @func	draw_set_mask(x, y, clip_sprite, clip_sprite_subimage, alphafix, simple, inverse)
/// @desc	Clip everything from a given clipping mask, returns false if shaders aren't supported, returns true otherwise
/// @param	{real}				x	The X position of where to draw the clip mask
/// @param	{real}				y	The Y position of where to draw the clip mask
/// @param	{Asset.GMSprite}	clip_sprite	The sprite asset
/// @param	{real}				clip_sprite_subimage	The subimage of the sprite asset to use
/// @arg	{bool}				alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @arg	{bool}				simple			Use the simple version of the shader, enable this for your "draw_circle"/"draw_ellipse"/"draw_rectangle"/"draw_triangle" functions
/// @arg	{bool}	inverse		Simulate the alphafix to all pixels inside the clip
/// @returns	{bool}
function draw_set_mask(_x, _y, _clip_sprite, _clip_sprite_subimage = 0, _alpha_fix = false, _simple = false)
{
	var _inverse = false;
	
	static u_clip_sprite_texture = !shaders_are_supported() ? -1 : shader_get_sampler_index(shd_masterclip, "u_clip_sprite_texture");
	static u_clip_sprite_uvs = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_uvs");
	static u_clip_sprite_size = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_size");
	static u_clip_sprite_texelsize = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_texelsize");
	static u_clip_sprite_worldposition = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_worldposition");
	static u_clip_sprite_trimmed = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_clip_sprite_trimmed");
	static u_alphafix = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_mask_alphafix");
	static u_inverse = !shaders_are_supported() ? -1 : shader_get_uniform(shd_masterclip, "u_mask_inverse");
	
	if global.performance
		return false;
	
	var shader = _simple ? shd_masterclip_basic : shd_masterclip;
	shader_set(shader);
	
	var clip_sprite_texture = sprite_get_texture(_clip_sprite, _clip_sprite_subimage);
	var clip_uvs = sprite_get_uvs(_clip_sprite, _clip_sprite_subimage);
	
	if !_alpha_fix
		gpu_set_blendmode(bm_normal);
	else
		reset_blendmode();
	
	shader_set_uniform_f(shader_get_uniform(shader, "u_domaskclip"), 1.0);
	texture_set_stage(u_clip_sprite_texture, clip_sprite_texture);
	shader_set_uniform_f(u_clip_sprite_uvs, clip_uvs[0], clip_uvs[1], clip_uvs[2], clip_uvs[3]);
	shader_set_uniform_f(u_clip_sprite_size, sprite_get_width(_clip_sprite), sprite_get_height(_clip_sprite));
	shader_set_uniform_f(u_clip_sprite_texelsize, texture_get_texel_width(clip_sprite_texture), texture_get_texel_height(clip_sprite_texture));
	shader_set_uniform_f(u_clip_sprite_trimmed, clip_uvs[4], clip_uvs[5], clip_uvs[6], clip_uvs[7]);
	shader_set_uniform_f(u_clip_sprite_worldposition, _x, _y);
	shader_set_uniform_f(u_alphafix, _alpha_fix ? 1.0 : 0.0);
	shader_set_uniform_f(u_inverse, _inverse ? 1.0 : 0.0);
	return true;
}
/// @func	draw_set_mask_texture(x, y, texture, alphafix, simple, inverse)
/// @desc	Clip everything from a given clipping mask, returns false if shaders aren't supported, returns true otherwise
/// @param	{real}				x	The X position of where to draw the clip mask
/// @param	{real}				y	The Y position of where to draw the clip mask
/// @param	{Pointer.Texture}	texture	The texture
/// @arg	{bool}				alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @arg	{bool}				simple			Use the simple version of the shader, enable this for your "draw_circle"/"draw_ellipse"/"draw_rectangle"/"draw_triangle" functions
/// @arg	{bool}	inverse		Simulate the alphafix to all pixels inside the clip
/// @returns	{bool}
function draw_set_mask_texture(_x, _y, _texture, _alpha_fix = false, _simple = false, _inverse = false)
{
	if global.performance
		return false;
	if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
	{
		var shader = _simple ? shd_masterclip_basic : shd_masterclip;
		shader_set(shader);
	}
	shader = shader_current();
	
	var u_clip_sprite_texture = shader_get_sampler_index(shader, "u_clip_sprite_texture");
	var u_clip_sprite_uvs = shader_get_uniform(shader, "u_clip_sprite_uvs");
	var u_clip_sprite_size = shader_get_uniform(shader, "u_clip_sprite_size");
	var u_clip_sprite_texelsize = shader_get_uniform(shader, "u_clip_sprite_texelsize");
	var u_clip_sprite_worldposition = shader_get_uniform(shader, "u_clip_sprite_worldposition");
	var u_clip_sprite_trimmed = shader_get_uniform(shader, "u_clip_sprite_trimmed");
	var u_alphafix = shader_get_uniform(shader, "u_mask_alphafix");
	var u_inverse = shader_get_uniform(shader, "u_mask_inverse");
	
	var clip_uvs = texture_get_uvs(_texture);
	shader_set_uniform_f(shader_get_uniform(shader, "u_domaskclip"), 1.0);
	texture_set_stage(u_clip_sprite_texture, _texture);
	shader_set_uniform_f(u_clip_sprite_uvs, clip_uvs[0], clip_uvs[1], clip_uvs[2], clip_uvs[3]);
	shader_set_uniform_f(u_clip_sprite_size, 1 / texture_get_texel_width(_texture), 1 / texture_get_texel_height(_texture));
	shader_set_uniform_f(u_clip_sprite_texelsize, texture_get_texel_width(_texture), texture_get_texel_height(_texture));
	shader_set_uniform_f(u_clip_sprite_trimmed, clip_uvs[4], clip_uvs[5], clip_uvs[6], clip_uvs[7]);
	shader_set_uniform_f(u_clip_sprite_worldposition, _x, _y);
	shader_set_uniform_f(u_alphafix, _alpha_fix ? 1.0 : 0.0);
	shader_set_uniform_f(u_inverse, _inverse ? 1.0 : 0.0);
	return true;
}