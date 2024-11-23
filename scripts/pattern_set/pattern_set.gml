function pattern_set(color_array, sprite, subimg, xscale, yscale, pattern, use_lang = false, pattern_subimage = global.Pattern_Index, pattern_xoffset = 0, pattern_yoffset = 0)
{
	static shade_multiplier = shader_get_uniform(global.Pal_Shader, "shade_multiplier");
    if !sprite_exists(pattern) or !sprite_exists(sprite)
        exit;
	
	shader_set(global.Pal_Shader);
    pattern_enable(true);
	
    pattern_set_pattern(pattern, pattern_subimage);
    pattern_set_sprite(sprite, subimg, xscale, yscale, use_lang, pattern_xoffset, pattern_yoffset);
    pattern_set_color_array(color_array);
	
	shader_set_uniform_f(shade_multiplier, 1);
}
