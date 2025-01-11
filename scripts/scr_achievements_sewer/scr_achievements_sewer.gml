function scr_achievements_sewer()
{
	add_achievement_notify("sewer1", function(data)
	{
		achievement_add_variable("sw1_killed", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.pizzaboy_dead
			achievement_get_variable("sw1_killed").value = true;
		else if type == notifs.end_level && arr[0] == "sewer" && achievement_get_variable("sw1_killed").value == 0
			achievement_unlock(name, "Can't Fool Me", spr_achievement_sewer, 0);
	});

	add_achievement_notify("sewer2", function(data)
	{
		achievement_add_variable("sw2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "sewer" && type == notifs.parry && arr[1] == obj_ninja
		{
			achievement_get_variable("sw2_count").value += 1;
			if achievement_get_variable("sw2_count").value >= 10
				achievement_unlock(name, "Food Clan", spr_achievement_sewer, 1);
		}
	});

	add_achievement_notify("sewer3", function(data)
	{
		achievement_add_variable("sw3_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "sewer" && global.panic && type == notifs.mrpinch_launch
			achievement_get_variable("sw3_count").value += 1;
		else if type == notifs.end_level && arr[0] == "sewer" && achievement_get_variable("sw3_count").value <= 0
			achievement_unlock(name, "Penny Pincher", spr_achievement_sewer, 2);
	});
}
