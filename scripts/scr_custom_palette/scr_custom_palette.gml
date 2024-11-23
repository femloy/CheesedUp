function cuspal_set(array)
{
	if array_length(array) != 64
		show_error("Array length of custom palette must be 64", true);
	
	static uniform_enable = shader_get_uniform(global.Pal_Shader, "custom_enable");
	static uniform_array = shader_get_uniform(global.Pal_Shader, "custom_palette");
	
	shader_set(global.Pal_Shader);
	
	shader_set_uniform_i(uniform_enable, true);
	shader_set_uniform_f_array(uniform_array, array);
}
function cuspal_reset()
{
	static uniform_enable = shader_get_uniform(global.Pal_Shader, "custom_enable");
	
	var shd = shader_current();
	shader_set(global.Pal_Shader);
	shader_set_uniform_i(uniform_enable, false);
	shader_set(shd);
}
