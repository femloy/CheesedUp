function scr_achievements_kidsparty()
{
	add_achievement_notify("kidsparty1", function(data)
	{
		achievement_add_variable("kp1_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.monster_dead && global.leveltosave == "kidsparty" && global.panic && room != kidsparty_secret1
		{
			achievement_get_variable("kp1_count").value += 1;
			if achievement_get_variable("kp1_count").value >= 9
				achievement_unlock(name, "And This... Is My Gun-On-A-Stick!", spr_achievement_kidsparty, 0);
		}
	});

	add_achievement_notify("kidsparty2", function(data)
	{
		achievement_add_variable("kp2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.monster_activate && global.leveltosave == "kidsparty" && !global.panic
			achievement_get_variable("kp2_count").value += 1;
		else if type == notifs.hungrypillar_dead && arr[0] == kidsparty_john
		{
			if achievement_get_variable("kp2_count").value <= 6
				achievement_unlock(name, "Let Them Sleep", spr_achievement_kidsparty, 1);
		}
	});

	add_achievement_notify("kidsparty3", function(data)
	{
		achievement_add_variable("kp3_hurted", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.monster_jumpscare && global.leveltosave == "kidsparty"
			achievement_get_variable("kp3_hurted").value = true;
		else if type == notifs.end_level && arr[0] == "kidsparty"
		{
			if achievement_get_variable("kp3_hurted").value == 0
				achievement_unlock(name, "Jumpspared", spr_achievement_kidsparty, 2);
		}
	});
}
