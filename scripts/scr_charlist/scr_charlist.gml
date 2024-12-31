#macro CHAR_LIST ["P", "N", "V", "S", "G", "M", "F", "MS", "D"]
function scr_charlist(only_modded = true)
{
	var list = only_modded ? [] : CHAR_LIST;
	if !live_enabled return list;
	
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var _mod = global.mods[i];
		if _mod.enabled
		{
			var names = struct_get_names(_mod.characters);
			while array_length(names)
			{
				var name = array_shift(names);
				array_push(list, name);
			}
		}
	}
	return list;
}
