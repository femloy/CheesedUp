function pattern_set_sprite(sprite, subimg, xscale, yscale, use_lang = false, xoffset = 0, yoffset = 0)
{
	static pattern_offset = shader_get_uniform(global.Pal_Shader, "pattern_offset");
	
	if use_lang
		sprite = lang_get_sprite(sprite) ?? sprite;
	
    var _tex = sprite_get_texture(sprite, subimg);
    var _uvs = sprite_get_uvs(sprite, subimg);
    shader_set_uniform_f(global.Pattern_Spr_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
    shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvs[4], _uvs[5], texture_get_width(_tex) / texture_get_texel_width(_tex), texture_get_height(_tex) / texture_get_texel_height(_tex));
    shader_set_uniform_f(global.Pattern_Spr_Scale, xscale, yscale);
	shader_set_uniform_f(pattern_offset, xoffset, yoffset);
}
