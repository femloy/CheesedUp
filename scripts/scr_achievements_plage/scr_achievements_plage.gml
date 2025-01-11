function scr_achievements_plage()
{
	add_achievement_notify("plage1", noone, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.baddie_hurtboxkill && global.leveltosave == "plage" && arr[1] == obj_canongoblin && arr[3] == obj_canongoblinbomb
			achievement_unlock(name, "Blowback", spr_achievement_beach, 0);
	});

	add_achievement_notify("plage2", function(data)
	{
		achievement_add_variable("b2_count", 0, false, true);
	},
	function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.treasureguy_unbury && global.leveltosave == "plage" && arr[1] == obj_treasureguy
		{
			achievement_get_variable("b2_count").value += 1;
			if achievement_get_variable("b2_count").value >= 7
				achievement_unlock(name, "X Marks The Spot", spr_achievement_beach, 1);
		}
	});

	add_achievement_notify("plage3", function(data)
	{
		achievement_add_variable("b3_hurt", false, false, true);
	},
	function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.hurt_player && global.leveltosave == "plage" && arr[2] == obj_canonexplosion
			achievement_get_variable("b3_hurt").value = true;
		else if type == notifs.end_level && arr[0] == "plage" && achievement_get_variable("b3_hurt").value == false
			achievement_unlock(name, "Demolition Expert", spr_achievement_beach, 2);
	});
}
