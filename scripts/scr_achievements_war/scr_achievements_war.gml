function scr_achievements_war()
{
	add_achievement_notify("war1", function(data)
	{
		achievement_add_variable("war1hurt", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.hurt_player && global.leveltosave == "war"
			achievement_get_variable("war1hurt").value += 1;
		else if type == notifs.end_level && arr[0] == "war" && achievement_get_variable("war1hurt").value <= 3
			achievement_unlock(name, "Decorated Veteran", spr_achievement_war, 0);
	});

	add_achievement_notify("war2", function(data)
	{
		achievement_add_variable("war2_missed", 0, false, true);
		achievement_add_variable("war2_hit", false, false, true);
		achievement_add_variable("war2_start", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "war"
		{
			if type == notifs.shotgunblast_start
			{
				achievement_get_variable("war2_hit").value = false;
				achievement_get_variable("war2_start").value = true;
			}
			else if (type == notifs.baddie_kill || type == notifs.enemies_dead || type == notifs.block_break || type == notifs.bazooka_explode) && achievement_get_variable("war2_start").value == 1
				achievement_get_variable("war2_hit").value = true;
			else if type == notifs.shotgunblast_end
			{
				var val = achievement_get_variable("war2_hit").value;
				achievement_get_variable("war2_start").value = false;
				if !val
				{
					achievement_get_variable("war2_missed").value += 1;
					trace("Sharpshooter: Shot missed!");
				}
			}
		}
		if type == notifs.end_level && arr[0] == "war" && achievement_get_variable("war2_missed").value <= 3
			achievement_unlock(name, "Sharpshooter", spr_achievement_war, 1);
	});
	add_achievement_notify("war3", noone, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.wartimer_endlevel && arr[0] >= 1 && global.leveltosave == "war"
			achievement_unlock(name, "Trip to the Warzone", spr_achievement_war, 2);
	});
}
