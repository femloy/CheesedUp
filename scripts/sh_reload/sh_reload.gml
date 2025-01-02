function sh_reload()
{
	if !WC_debug
		return WC_NODEBUG;
	
	array_foreach(global.mods, function(_mod)
	{
		if !_mod.enabled
			exit;
		
		_mod.cleanup();
		_mod.init();
	});
}
function meta_reload()
{
	return
	{
		description: "reloads all mod loader mods, by turning them off and back on again",
	}
}
