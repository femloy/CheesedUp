function pal_swap_reset()
{
	static uniform_enable = shader_get_uniform(global.Pal_Shader, "custom_enable");
	if global.performance
		exit;
	
	shader_set(global.Pal_Shader);
	shader_set_uniform_f(global.Pal_Index, 0);
	pattern_enable(false);
	shader_set_uniform_i(uniform_enable, false);
	shader_set_uniform_i(global.Pal_Super_Noise, false);
	
	if event_type == ev_draw && event_number == ev_gui
	{
		reset_shader_fix();
		reset_blendmode();
	}
	else
		shader_reset();
}
