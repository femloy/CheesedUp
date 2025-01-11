function scr_achievements_chateau()
{
	add_achievement_notify("chateau1", function(data)
	{
		achievement_add_variable("ch1_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "chateau" && type == notifs.baddie_kill && arr[2] == obj_ghostknight
		{
			achievement_get_variable("ch1_count").value += 1;
			if achievement_get_variable("ch1_count").value >= 30
				achievement_unlock(name, "Cross To Bare", spr_achievement_chateau, 0);
		}
	});

	add_achievement_notify("chateau2", function(data)
	{
		achievement_add_variable("ch2_hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.hurt_player && (arr[2] == obj_anchortrap || arr[2] == obj_knighttrap)
			achievement_get_variable("ch2_hurt").value = true;
		if type == notifs.end_level && arr[0] == "chateau" && !achievement_get_variable("ch2_hurt").value
			achievement_unlock(name, "Haunted Playground", spr_achievement_chateau, 1);
	});

	add_achievement_notify("chateau3", function(data)
	{
		achievement_add_variable("ch3_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.destroyed_area && global.leveltosave == "chateau"
		{
			achievement_get_variable("ch3_count").value += 1;
			if achievement_get_variable("ch3_count").value >= 10
				achievement_unlock(name, "Skullsplitter", spr_achievement_chateau, 2);
		}
	});
}
