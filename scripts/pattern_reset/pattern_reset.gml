function pattern_reset()
{
	var g = shader_current();
	shader_set(global.Pal_Shader);
    pattern_enable(false);
	shader_set(g);
}
