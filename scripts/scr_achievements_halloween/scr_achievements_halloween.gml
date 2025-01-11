function scr_achievements_halloween()
{
	var pats = [
		["candy", 5, spr_peppattern10],
		["bloodstained", 10, spr_peppattern11],
		["bat", 15, spr_peppattern12],
		["pumpkin", 20, spr_peppattern13],
		["fur", 25, spr_peppattern14],
		["flesh", 30, spr_peppattern15]
	];
	for (var i = 0; i < array_length(pats); i++)
	{
		var pat = pats[i];
		var p = add_achievement_notify(concat("pal_", pat[0]), -4, function(data)
		{
			var type = data[0];
			var arr = data[1];
			if type == notifs.pumpkin_collect && arr[0] >= pattern[1]
				palette_unlock(name, pattern[0], 12, pattern[2]);
		}, false, "Palettes", pat[0]);
		
		if !is_undefined(p) && !p.unlocked
			p.pattern = pat;
	}
}