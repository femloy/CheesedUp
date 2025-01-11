function scr_achievements_dungeon()
{
	add_achievement_notify("dungeon1", function(data)
	{
		achievement_add_variable("dun1hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.boilingsauce && global.leveltosave == "dungeon"
			achievement_get_variable("dun1hurt").value = true;
		else if type == notifs.end_level && arr[0] == "dungeon" && achievement_get_variable("dun1hurt").value == 0
			achievement_unlock(name, "Very Very Hot Sauce", spr_achievement_dungeon, 0);
	});

	add_achievement_notify("dungeon2", noone, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.panic && type == notifs.superjump_timer && global.leveltosave == "dungeon" && arr[0] >= 120
			achievement_unlock(name, "Eruption Man", spr_achievement_dungeon, 1);
	});

	add_achievement_notify("dungeon3", function(data)
	{
		achievement_add_variable("dun3hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.hurt_player && global.leveltosave == "dungeon" && arr[2] == obj_pizzacutter2
			achievement_get_variable("dun3hurt").value = true;
		else if type == notifs.end_level && arr[0] == "dungeon" && achievement_get_variable("dun3hurt").value == false
			achievement_unlock(name, "Unsliced Pizzaman", spr_achievement_dungeon, 2);
	});
}
