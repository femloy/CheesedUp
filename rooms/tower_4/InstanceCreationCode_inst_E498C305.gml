refresh_func = function()
{
	if CHAR_BASENOISE
		text = lang_get_value_granny("hubtips7N");
	else
		text = lang_get_value_granny("hubtips7");
}
refresh_func();
trace("hubtips7: ", text);
