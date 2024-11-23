function scr_random_granny()
{
	var count = instance_number(obj_tutorialbook);
	var n = irandom(count - 1);
	var b = -4;
	for (var found = false; !found; n = irandom(count - 1))
	{
		with (instance_find(obj_tutorialbook, n))
		{
			if (showgranny)
			{
				found = true;
				b = id;
			}
		}
	}
	with (obj_tutorialbook)
	{
		if (id != b && showgranny)
			instance_destroy();
	}
}
function lang_get_value_granny(lang)
{
	lang_name = lang;
	return lang_get_value(lang);
}
