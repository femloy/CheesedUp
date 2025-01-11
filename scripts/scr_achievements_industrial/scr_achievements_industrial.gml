function scr_achievements_industrial()
{
	add_achievement_notify("industrial1", function(data)
	{
		achievement_add_variable("i1_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "industrial" && type == notifs.priest_collect && (arr[2] == states.boxxedpep || arr[2] == states.boxxedpepjump || arr[2] == states.boxxedpepspin)
		{
			achievement_get_variable("i1_count").value += 1;
			if achievement_get_variable("i1_count").value >= 4
				achievement_unlock(name, "Unflattenning", spr_achievement_industrial, 0);
		}
	});

	add_achievement_notify("industrial2", function(data)
	{
		achievement_add_variable("i2_count", 0, false, true);
		achievement_add_variable("i2_hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if room == industrial_secret1
		{
			if type == notifs.baddie_kill && arr[2] == obj_sausageman
				achievement_get_variable("i2_count").value += 1;
			else if type == notifs.hurt_player
				achievement_get_variable("i2_hurt").value = true;
		}
		if type == notifs.secret_exit && arr[0] == industrial_secret1 && achievement_get_variable("i2_hurt").value == 0 && achievement_get_variable("i2_count").value >= 11
			achievement_unlock(name, "Whoop This", spr_achievement_industrial, 1);
	});

	add_achievement_notify("industrial3", function(data)
	{
		achievement_add_variable("i3_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "industrial" && type == notifs.baddie_kill && arr[2] == obj_robot
		{
			achievement_get_variable("i3_count").value += 1;
			if achievement_get_variable("i3_count").value >= 31
				achievement_unlock(name, "There Can Be Only One", spr_achievement_industrial, 2);
		}
	});
}
