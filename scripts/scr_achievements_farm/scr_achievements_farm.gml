function scr_achievements_farm()
{
	add_achievement_notify("farm1", function(data)
	{
		achievement_add_variable("f1_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.enemies_dead
		{
			var n = achievement_get_variable("f1_count");
			var r = room_get_name(arr[1]);
			if obj_player.state == states.backbreaker && (string_letters(r) == "farm" || string_letters(r) == "farmb")
			{
				n.value++;
				if n.value >= 3
					achievement_unlock(name, "No one is safe", spr_achievement_farm, 2);
			}
		}
	});

	add_achievement_notify("farm2", -4, function(data)
	{
		var type = data[0];
		if type == notifs.mort_block
			achievement_unlock(name, "Cube Menace", spr_achievement_farm, 1);
	});

	add_achievement_notify("farm3", function(data)
	{
		achievement_add_variable("f3_hurted", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if (type == notifs.hurt_player || type == notifs.fall_outofbounds) && (arr[1] == states.mort || arr[1] == states.morthook || arr[1] == states.mortattack || arr[1] == states.mortjump)
			achievement_get_variable("f3_hurted").value = true;
		if type == notifs.end_level && arr[0] == "farm" && !achievement_get_variable("f3_hurted").value
			achievement_unlock(name, "Good Egg", spr_achievement_farm, 0);
	});
}
