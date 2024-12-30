function live_snippet_call_array(l_snippet, l_argv)
{
	/// live_snippet_call(snippet:gml_program, ...args:any)->bool
	/// @param {gml_program} snippet
	/// @param {array<any>} args_array
	/// @returns {bool}
	if live_enabled
	{
		live_custom_self = self;
		live_custom_other = other;
		var l_th = l_snippet.h_call_v("snippet", l_argv, false);
		if l_th == undefined
		{
			live_result = "(script missing)";
			return false;
		}
		else if l_th.h_status == 3
		{
			live_result = l_th.h_result;
			return true;
		}
		else
		{
			live_result = l_th.h_error_text ?? "(unknown error)";
			return false;
		}
	}
	return false;
}
