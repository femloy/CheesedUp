function scr_achievements_street()
{
	add_achievement_update("street1", 60, -4, function(data)
	{
		if room == street_bacon
			achievement_unlock(name, "Pan Fried", spr_achievement_street, 0);
	});
	
	add_achievement_notify("street2", function(data)
	{
		achievement_add_variable("st2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if global.leveltosave == "street"
		{
			if type == notifs.brickball
				achievement_get_variable("st2_count").value = 0;
			else if type == notifs.brick_killenemy
			{
				achievement_get_variable("st2_count").value += 1;
				if achievement_get_variable("st2_count").value >= 3
					achievement_unlock(name, "Strike!", spr_achievement_street, 1);
			}
		}
	});
	
	add_achievement_notify("street3", function(data)
	{
		achievement_add_variable("st3_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.pigcitizen_photo
		{
			achievement_get_variable("st3_count").value += 1;
			if achievement_get_variable("st3_count").value >= 14
				achievement_unlock(name, "Say Oink!", spr_achievement_street, 2);
		}
	});
}
