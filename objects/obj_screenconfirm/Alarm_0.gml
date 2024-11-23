if restart exit;

alarm[0] = 60;
timer--;
if (timer <= 0)
{
	if is_callable(cancel)
		cancel();
	else
	{
		variable_global_set(varname, savedoption);
		screen_apply_fullscreen(global.option_fullscreen);
		screen_apply_size();
	}
    instance_destroy();
}
