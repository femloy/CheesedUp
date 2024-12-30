function scr_modding_hooks()
{
	return
	[
		"savecondition",
		"panic",
		"prankcondition",
		
		"modifier/reset",
		"modifier/geticon",
		"modifier/menu",
		"modifier/preplayer",
		"modifier/postplayer",
		
		"instance/destroy"
	];
}

function scr_assert_hook(hook_name)
{
	if !array_contains(scr_modding_hooks(), hook_name)
		show_error($"Hook \"{hook_name}\" is missing from scr_modding_hooks()", true);
}

function scr_modding_hook(code, args = [])
{
	scr_assert_hook(code);
	
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var _mod = global.mods[i];
		if !_mod.enabled continue;
		
		scr_modding_process(_mod, code, args, "hooks");
	};
}

#macro HOOK_CALLBACK_STOP false
globalvar stored_result;
stored_result = undefined;

function scr_modding_hook_callback(code, callback, args = [])
{
	scr_assert_hook(code);
	
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var _mod = global.mods[i];
		if !_mod.enabled continue;
		
		scr_modding_process(_mod, code, args, "hooks");
		
		if callback(_mod) == HOOK_CALLBACK_STOP
			break;
	}
	
	return live_result;
}
