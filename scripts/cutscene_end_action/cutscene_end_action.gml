function cutscene_end_action()
{
	scene++;
	if scene > array_length(scene_info) - 1
	{
		if !loop
			instance_destroy();
		else
			scene = 0;
	}
}
