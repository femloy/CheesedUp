function scr_achievements_badland()
{
	add_achievement_notify("badland1", function(data)
	{
	
	}, function(data)
	{
		var type = data[0];
		if type == notifs.totem_revive && global.leveltosave == "badland"
			achievement_unlock(name, "Peppino's Rain Dance", spr_achievement_badland, 0);
	});

	add_achievement_notify("badland2", function(data)
	{
		achievement_add_variable("bad2count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.baddie_kill && global.leveltosave == "badland" && arr[2] == obj_clerk
		{
			achievement_get_variable("bad2count").value += 1;
			if achievement_get_variable("bad2count").value >= 5
				achievement_unlock(name, "Unnecessary Violence", spr_achievement_badland, 1);
		}
	});

	add_achievement_notify("badland3", function(data)
	{
		achievement_add_variable("bad3hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.cow_kick && global.leveltosave == "badland"
			achievement_get_variable("bad3hurt").value = true;
		else if type == notifs.end_level && arr[0] == "badland" && achievement_get_variable("bad3hurt").value == 0
			achievement_unlock(name, "Alien Cow", spr_achievement_badland, 2);
	});
}
