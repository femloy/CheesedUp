function scr_achievements_forest()
{
	add_achievement_update("forest1", 5, -4, function(data)
	{
		if global.leveltosave == "forest"
		{
			var b = false;
			with obj_player
			{
				if !b && state == states.backbreaker && distance_to_object(obj_beedeco) < 300
					b = true;
			}
			if b
				achievement_unlock(name, "Bee Nice", spr_achievement_forest, 0);
		}
	});
	
	add_achievement_notify("forest2", function(data)
	{
		achievement_add_variable("fo2_count", 0, false, true);
	},
	function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.levelblock_break && global.leveltosave == "forest" && (arr[0] == obj_smallforestblock || arr[0] == obj_bigforestblock)
		{
			achievement_get_variable("fo2_count").value += 1;
			if achievement_get_variable("fo2_count").value >= 183
				achievement_unlock(name, "Lumberjack", spr_achievement_forest, 1);
		}
	});
	
	add_achievement_notify("forest3", noone, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.baddie_hurtboxkill && global.leveltosave == "forest" && arr[1] == obj_noisegoblin && arr[3] == obj_noisegoblin_arrow
			achievement_unlock(name, "Bullseye", spr_achievement_forest, 2);
	});
}
