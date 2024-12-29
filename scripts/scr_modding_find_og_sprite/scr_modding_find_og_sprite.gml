function scr_modding_find_og_sprite(mod_sprite)
{
	for(var i = 0, n = array_length(global.mods); i < n; ++i)
	{
		var this_mod = global.mods[i];
		if !this_mod.enabled
			continue;
		
		for(var j = 0, o = array_length(this_mod.sprite_cache); j < o; ++j)
		{
			var this_sprite = this_mod.sprite_cache[j];
			if !is_struct(this_sprite)
				continue;
			
			if this_sprite.sprite == mod_sprite
				return this_sprite.old;
		}
	}
}
