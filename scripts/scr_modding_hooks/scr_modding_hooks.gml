function scr_modding_hooks()
{
	return
	[
		"savecondition",
		"panic",
		"prankcondition",
		
		// Instance
		"instance/destroy",
		
		// Modifier
		"modifier/reset",
		"modifier/geticon",
		"modifier/menu",
		"modifier/preplayer",
		"modifier/postplayer",
		
		// Player
		"player/reset",
		"player/prestate",
		"player/poststate",
		"player/crouchmask",
		"player/instakill",
		"player/mach3effect",
		"player/blureffect",
		"player/chargeeffect/condition",
		"player/chargeeffect/prestep",
		"player/chargeeffect/poststep",
		
		// Block
		"block/all",
		"block/side",
		"block/below",
		"block/above",
		"block/metalside",
		"block/metalbelow",
		"block/preventbump",
		
		// Player states
		"player/suplexdash/animation",
		"player/suplexdash/preperform",
		"player/suplexdash/postperform",
		"player/suplexdash/precancel",
		"player/suplexdash/postcancel",
		"player/suplexdash/prelongjump",
		"player/suplexdash/postlongjump",
		"player/climbwall/prejump",
		"player/climbwall/postjump",
		
		// Enemy states
		"enemy/grabbed/position",
		
		// TV
		"tv/transfo",
		"tv/expression",
		"tv/palette",
		"tv/position",
		"tv/drawcombo",
		"tv/postdraw",
		"tv/background",
		
		// Music
		"music/totem",
		"music/panic",
		"music/panicstep",
		
		// Menus
		"dresser/postpalettes",
		"jukebox/postsongs",
	];
}

function scr_assert_hook(hook_name)
{
	if !array_contains(scr_modding_hooks(), hook_name)
		show_error($"Hook \"{hook_name}\" is missing from scr_modding_hooks()", true);
}

function scr_modding_hook(code, args = [])
{
	// simple
	scr_assert_hook(code);
	
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var _mod = global.mods[i];
		if !_mod.enabled continue;
		
		scr_modding_process(_mod, code, args, "hooks");
	};
}

#macro HOOK_CALLBACK_STOP -1
#macro HOOK_CALLBACK_SIMPLIFY -2

globalvar stored_result;
stored_result = undefined;

function scr_modding_hook_callback(code, callback, args = [])
{
	// custom callback
	scr_assert_hook(code);
	
	live_result = undefined;
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var _mod = global.mods[i];
		if !_mod.enabled continue;
		
		if scr_modding_process(_mod, code, args, "hooks") && !is_undefined(callback)
		{
			var c = callback(_mod);
			if c == HOOK_CALLBACK_STOP
				break;
			if c == HOOK_CALLBACK_SIMPLIFY
				callback = undefined;
		}
	}
	
	return live_result;
}

function scr_modding_hook_falser(code, args = [])
{
	// returns true, unless any mod returns false
	if !live_enabled return true;
	
	stored_result = true;
	scr_modding_hook_callback(code, function()
	{
		if live_result == false
		{
			stored_result = false;
			return HOOK_CALLBACK_SIMPLIFY;
		}
	}, args);
	return stored_result;
}

function scr_modding_hook_truer(code, args = [])
{
	// returns false, unless any mod returns true
	if !live_enabled return false;
	
	stored_result = false;
	scr_modding_hook_callback(code, function()
	{
		if live_result == true
		{
			stored_result = true;
			return HOOK_CALLBACK_SIMPLIFY;
		}
	}, args);
	return stored_result;
}

function scr_modding_hook_any(code, args = [])
{
	// returns undefined, unless any mod returns anything
	if !live_enabled return undefined;
	
	scr_modding_hook_callback(code, function()
	{
		if live_result != undefined
			return HOOK_CALLBACK_STOP;
	}, args);
	
	return live_result;
}
