function scr_achievements_minigolf()
{
	add_achievement_notify("minigolf1", function(data)
	{
		achievement_add_variable("g1_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.pizzaball_goal && arr[0] == spr_pizzaball_rank1
		{
			achievement_get_variable("g1_count").value += 1;
			if achievement_get_variable("g1_count").value >= 9
				achievement_unlock(name, "Primo Golfer", spr_achievement_golf, 0);
		}
	});

	add_achievement_notify("minigolf2", function(data)
	{
		achievement_add_variable("g2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.pizzaball && (arr[0] == obj_player1 || arr[0] == obj_player1)
			achievement_get_variable("g2_count").value = 0;
		else if type == notifs.pizzaball_killenemy
		{
			achievement_get_variable("g2_count").value += 1;
			if achievement_get_variable("g2_count").value >= 3
				achievement_unlock(name, "Nice Shot", spr_achievement_golf, 1);
		}
	});

	add_achievement_notify("minigolf3", function(data)
	{
		achievement_add_variable("g3_hit", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.pizzaball
		{
			if arr[0] == obj_golfburger
				achievement_get_variable("g3_hit").value = true;
			else
				achievement_get_variable("g3_hit").value = false;
		}
		else if type == notifs.pizzaball_goal && achievement_get_variable("g3_hit").value == 1
			achievement_unlock(name, "Helpful Burger", spr_achievement_golf, 2);
	});
}
