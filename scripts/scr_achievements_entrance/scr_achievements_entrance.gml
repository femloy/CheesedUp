function scr_achievements_entrance()
{
	add_achievement_notify("entrance1", function()
	{
		achievement_add_variable("entr1count", 0, false, true);
	},
	function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.levelblock_break && global.leveltosave == "entrance" && arr[0] == obj_deadjohnparent
		{
			achievement_get_variable("entr1count").value += 1;
			if (achievement_get_variable("entr1count").value >= 16)
				achievement_unlock(name, "John Gutted", spr_achievement_entrance, 0);
		}
	});

	add_achievement_notify("entrance2", noone, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.end_level && arr[0] == "entrance" && (arr[2] < 2 || (arr[2] == 2 && arr[3] <= 0))
			achievement_unlock(name, "Let's Make This Quick", spr_achievement_entrance, 1);
	});

	add_achievement_notify("entrance3", function()
	{
		achievement_add_variable("entr3count", 0, false, true)
	},
	function(data)
	{
		var type = data[0];
		var arr = data[1];
		if (type == notifs.combo_end && arr[0] >= 99 && global.leveltosave == "entrance") || (type == notifs.baddie_kill && global.combo >= 99 && global.leveltosave == "entrance")
			achievement_unlock(name, "Primate Rage", spr_achievement_entrance, 2);
	});
}
