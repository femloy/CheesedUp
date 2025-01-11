function scr_achievements_ruin()
{
	add_achievement_notify("ruin1", function(data)
	{
		achievement_add_variable("ruin1hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		var val = achievement_get_variable("ruin1hurt");
		if type == notifs.hurt_player && global.leveltosave == "ruin" && arr[2] == obj_canonexplosion
		{
			val.value = true;
			trace("Locked out of Thrill Seeker!");
		}
		else if type == 5 && arr[0] == "ruin" && !val.value
			achievement_unlock(name, "Thrill Seeker", spr_achievement_ruin, 0);
	});

	add_achievement_notify("ruin2", noone, function(data)
	{
		var type = data[0];
		if type == notifs.ratblock_explode && global.leveltosave == "ruin"
			achievement_unlock(name, "Volleybomb", spr_achievement_ruin, 1);
	});

	add_achievement_notify("ruin3", function(data)
	{
		achievement_add_variable("ruin3count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.cheeseblock_activate && global.leveltosave == "ruin"
		{
			achievement_get_variable("ruin3count").value += 1;
			if (achievement_get_variable("ruin3count").value >= 350)
				achievement_unlock(name, "Delicacy", spr_achievement_ruin, 2);
		}
	});
}
