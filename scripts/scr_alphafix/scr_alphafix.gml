#macro surface_create_base surface_create
#macro surface_create surface_create_hook

function surface_create_hook(w, h, format = surface_rgba8unorm)
{
	if w > 16384 or h > 16384
		log_source("SURFACE TOO LARGE!");
	return surface_create_base(min(w, 16384), min(h, 16384), format);
}

#macro surface_set_target_base surface_set_target
#macro surface_set_target surface_set_target_hook

function surface_set_target_hook(surface)
{
	if event_type == ev_draw && event_number == ev_gui
		toggle_alphafix(false);
	return surface_set_target_base(surface);
}

#macro surface_reset_target_base surface_reset_target
#macro surface_reset_target surface_reset_target_hook

function surface_reset_target_hook()
{
	if event_type == ev_draw && event_number == ev_gui
		toggle_alphafix(true);
	return surface_reset_target_base();
}

function reset_blendmode()
{
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
}
function reset_shader_fix()
{
	shader_set(shd_alphafix);
}
function toggle_alphafix(toggle)
{
	if toggle
	{
		reset_blendmode();
		if shader_current() == -1
			reset_shader_fix();
	}
	else
	{
		gpu_set_blendmode(bm_normal);
		if shader_current() == shd_alphafix
			shader_reset();
	}
}
