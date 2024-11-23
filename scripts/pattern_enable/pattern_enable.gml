function pattern_enable(enable)
{
	if shader_current() == shd_pal_swapper
		shader_set_uniform_i(global.Pattern_Enable, enable);
	if shader_current() == shd_noise_afterimage
		shader_set_uniform_i(global.N_Pattern_Enabled, enable);
}
