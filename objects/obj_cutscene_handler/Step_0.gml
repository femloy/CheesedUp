var call = scene_info[scene][0];
if is_callable(call)
	script_execute_ext(call, scene_info[scene], 1);
else
{
	trace();
	trace("Invalid cutscene handler ", call, ":\n", scene_info);
	trace();
	instance_destroy();
}
