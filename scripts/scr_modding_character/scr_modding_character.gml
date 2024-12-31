function scr_modding_character(char)
{
	if !live_enabled return noone;
	stored_result = noone;
	array_foreach(global.mods, method({char: char}, function(_mod)
	{
		if _mod.enabled && _mod.characters[$ char] != undefined
			stored_result = _mod.characters[$ char];
	}));
	return stored_result;
}
