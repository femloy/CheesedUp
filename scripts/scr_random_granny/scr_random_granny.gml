function scr_random_granny()
{
	var candidates = [];
	with obj_tutorialbook
	{
		if showgranny
			array_push(candidates, id);
	}
	
	var b = candidates[irandom(array_length(candidates) - 1)];
	
	with obj_tutorialbook
	{
		if id != b && showgranny
			instance_destroy();
	}
}
function lang_get_value_granny(lang)
{
	lang_name = lang;
	return lang_get_value(lang);
}
