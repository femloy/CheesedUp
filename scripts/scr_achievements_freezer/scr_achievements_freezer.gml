function scr_achievements_freezer()
{
	add_achievement_notify("freezer1", function(data)
	{
		achievement_add_variable("fr1_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if global.leveltosave == "freezer" && type == notifs.destroy_iceblock
		{
			achievement_get_variable("fr1_count").value += 1;
			if achievement_get_variable("fr1_count").value >= 13
				achievement_unlock(name, "Frozen Nuggets", spr_achievement_freezer, 0);
		}
	});
	
	add_achievement_notify("freezer2", function(data)
	{
		achievement_add_variable("fr2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "freezer" && type == notifs.baddie_kill && arr[2] == obj_fakesanta
		{
			achievement_get_variable("fr2_count").value += 1;
			if achievement_get_variable("fr2_count").value >= 5
				achievement_unlock(name, "Frozen Nuggets", spr_achievement_freezer, 1);
		}
	});
	
	add_achievement_notify("freezer3", function(data)
	{
		achievement_add_variable("fr3_fall", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.fall_outofbounds && global.leveltosave == "freezer"
			achievement_get_variable("fr3_fall").value = true;
		else if type == notifs.end_level && arr[0] == "freezer" && achievement_get_variable("fr3_fall").value == 0
			achievement_unlock(name, "Ice Climber", spr_achievement_freezer, 2);
	});
}
