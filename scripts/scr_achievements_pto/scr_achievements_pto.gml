function scr_achievements_pto()
{
	// Obtained by beating Grinch Race
	add_achievement_notify("pal_grinch", noone, function(data)
	{
		var type = data[0], arr = data[1];
		if type == notifs.end_level && arr[0] == "grinch"
		{
			if !MOD.EasyMode
				palette_unlock(name, "grinch", 12, spr_pattern_grinch);
		}
	}, false, "Palettes", "grinch");
	
	// Obtained by using the abandoned computer in the Outerfloor
	add_achievement_notify("pal_mario", noone, function(data)
	{
		var type = data[0];
		if type == notifs.msdos_marior
			palette_unlock(name, "mario", 12, spr_pattern_mario);
	}, false, "Palettes", "mario");
	
	// Obtained by beating Cosmic Cone
	add_achievement_notify("pal_cosmic", noone, function(data)
	{
		var type = data[0];
		if type == notifs.end_level && MOD.CosmicClones
			palette_unlock(name, "cosmic", 12, spr_pattern_cosmic);
	}, false, "Palettes", "cosmic");
	
	// Obtained by beating a time attack par
	add_achievement_notify("pal_time", noone, function(data)
	{
		var type = data[0];
		if type == notifs.end_level && global.timeattack && global.tatime <= global.tasrank
			palette_unlock(name, "time", 12, spr_pattern_time);
	}, false, "Palettes", "time");
	
	// Obtained by beating VVVVVV
	add_achievement_notify("pal_arrows", noone, function(data)
	{
		var type = data[0];
		if type == notifs.end_level && MOD.GravityJump
			palette_unlock(name, "arrows", 12, spr_pattern_arrows);
	}, false, "Palettes", "arrows");
	
	// Obtained by beating Lights Out
	add_achievement_notify("pal_storm", noone, function(data)
	{
		var type = data[0];
		if type == notifs.end_level && MOD.Spotlight
			palette_unlock(name, "storm", 12, spr_pattern_storm);
	}, false, "Palettes", "storm");
}
