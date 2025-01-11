function scr_achievements_saloon()
{
	add_achievement_notify("saloon1", function(data)
	{
		achievement_add_variable("s1_beer", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.beer_destroy && global.leveltosave == "saloon"
		{
			achievement_get_variable("s1_beer").value += 1;
			if achievement_get_variable("s1_beer").value >= 58
				achievement_unlock(name, "Non-Alcoholic", spr_achievement_saloon, 0);
		}
	});

	add_achievement_notify("saloon2", function(data)
	{
		achievement_add_variable("s2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.timedgateclock && global.leveltosave == "saloon"
			achievement_get_variable("s2_count").value += 1;
		else if type == notifs.end_level
		{
			var arr = data[1];
			if arr[0] == "saloon" && achievement_get_variable("s2_count").value == 9
				achievement_unlock(name, "Already Pressed", spr_achievement_saloon, 1);
		}
	});

	add_achievement_notify("saloon3", function(data)
	{
		achievement_add_variable("s3_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.flush && global.leveltosave == "saloon"
		{
			achievement_get_variable("s3_count").value += 1;
			if achievement_get_variable("s3_count").value >= 8
				achievement_unlock(name, "Royal Flush", spr_achievement_saloon, 2);
		}
	});
}
