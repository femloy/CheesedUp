function scr_achievements_peppino()
{
	#region PALETTES
	
	add_achievement_notify("pal_unfunny", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		var arr = data[1];
		if type == notifs.combo_end && arr[0] >= 75
			palette_unlock(name, "unfunny", 3);
	}, false, "Palettes", "unfunny");

	add_achievement_notify("pal_mooney", noone, function(data)
	{
		if obj_achievementtracker.character != "P" or global.swapmode
			exit;
		
		var type = data[0];
		if type == notifs.mrmooney_donated
			palette_unlock(name, "mooney", 15);
	}, false, "Palettes", "mooney");

	add_achievement_notify("pal_sage", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.end_level
		{
			var _found = false;
			ini_open_from_string(obj_savesystem.ini_str);
			var lvl = ["entrance", "medieval", "ruin", "dungeon"];
			for (var i = 0; i < array_length(lvl); i++)
			{
				if (ini_read_real("Highscore", lvl[i], 0) == 0)
				{
					_found = true;
					break;
				}
			}
			ini_close();
			if !_found && global.file_minutes < 60
				palette_unlock(name, "sage", 5);
		}
	}, false, "Palettes", "sage");

	add_achievement_notify("pal_money", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.end_level
		{
			var _money = 0;
			ini_open_from_string(obj_savesystem.ini_str);
			var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon"];
			for (var i = 0; i < array_length(lvl); i++)
			{
				for (var j = 0; j < 5; j++)
				{
					if (ini_read_real("Toppin", concat(lvl[i], j + 1), false) == 1)
						_money += 10;
				}
			}
			_money -= ini_read_real("w1stick", "reduction", 0);
			_money -= ini_read_real("w2stick", "reduction", 0);
			ini_close();
			if _money >= 300
				palette_unlock(name, "money", 4);
		}
	}, false, "Palettes", "money");

	add_achievement_notify("pal_blood", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.end_level
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _count = ini_read_real("Game", "enemies", 0);
			ini_close();
			if _count >= 1000
				palette_unlock(name, "blood", 6);
		}
	}, false, "Palettes", "blood");

	add_achievement_notify("pal_tv", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.end_level
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _found = false;
			var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
			var map = ds_map_create();
			ds_map_set(map, "p", 5);
			ds_map_set(map, "s", 4);
			ds_map_set(map, "a", 3);
			ds_map_set(map, "b", 2);
			ds_map_set(map, "c", 1);
			ds_map_set(map, "d", 0);
			for (var i = 0; i < array_length(lvl); i++)
			{
				var rank = ini_read_string("Ranks", lvl[i], "d");
				if (ds_map_find_value(map, rank) < ds_map_find_value(map, "p"))
					_found = true;
			}
			ds_map_destroy(map);
			ini_close();
			if !_found
				palette_unlock(name, "tv", 7);
		}
	}, false, "Palettes", "tv");

	add_achievement_notify("pal_dark", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		var arr = data[1];
		if type == notifs.unlocked_achievement && (arr[0] == "pepperman" || arr[0] == "vigilante" || arr[0] == "noise" || arr[0] == "fakepep" || arr[0] == "pizzaface")
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _found = false;
			var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"];
			for (var i = 0; i < array_length(ach); i++)
			{
				if (ini_read_real("achievements", ach[i], false) == 0)
					_found = true;
			}
			ini_close();
			if !_found
				palette_unlock(name, "dark", 8);
		}
	}, false, "Palettes", "dark");

	add_achievement_notify("pal_shitty", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.crawl_in_shit
			palette_unlock(name, "shitty", 9);
	}, false, "Palettes", "shitty");

	add_achievement_notify("pal_golden", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.end_level
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _found = false;
			var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
			var map = ds_map_create();
			ds_map_set(map, "p", 5);
			ds_map_set(map, "s", 4);
			ds_map_set(map, "a", 3);
			ds_map_set(map, "b", 2);
			ds_map_set(map, "c", 1);
			ds_map_set(map, "d", 0);
			for (var i = 0; i < array_length(lvl); i++)
			{
				var rank = ini_read_string("Ranks", lvl[i], "d");
				if (ds_map_find_value(map, rank) < ds_map_find_value(map, "s"))
					_found = true;
			}
			ds_map_destroy(map);
			ini_close();
			if !_found
				palette_unlock(name, "golden", 10);
		}
	}, false, "Palettes", "golden");

	add_achievement_notify("pal_garish", function()
	{
		achievement_add_variable("garish_count", 0, true, false);
	}, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.taunt
		{
			achievement_get_variable("garish_count").value += 1;
			if achievement_get_variable("garish_count").value >= 50
				palette_unlock(name, "garish", 11);
		}
	}, false, "Palettes", "garish");
	
	#endregion
	#region PATTERNS
	
	add_achievement_notify("pal_funny", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		var arr = data[1];
		if type == notifs.combo_end && arr[0] >= 70 && arr[0] < 75
			palette_unlock(name, "funny", 12, spr_peppattern1);
	}, false, "Palettes", "funny");

	add_achievement_notify("pal_itchy", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		var arr = data[1];
	
		if global.leveltosave == "street" && type == notifs.hurt_player && arr[2] == obj_grandpa
			palette_unlock(name, "itchy", 12, spr_peppattern2);
	}, false, "Palettes", "itchy");

	add_achievement_notify("pal_pizza", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.firsttime_ending
			palette_unlock(name, "pizza", 12, spr_peppattern3);
	}, false, "Palettes", "pizza");

	add_achievement_notify("pal_stripes", function()
	{
		achievement_add_variable("stripes_count", 0, true, false);
	}, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.rattumble_dead
		{
			achievement_get_variable("stripes_count").value += 1;
			if (achievement_get_variable("stripes_count").value >= 30)
				palette_unlock(name, "stripes", 12, spr_peppattern4);
		}
	}, false, "Palettes", "stripes");

	add_achievement_notify("pal_goldemanne", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.unlocked_achievement
		{
			var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
			var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface", "sranks1", "sranks2", "sranks3", "sranks4", "sranks5"];
			for (var i = 0; i < array_length(lvl); i++)
			{
				var b = lvl[i]
				for (var j = 0; j < 3; j++)
					array_push(ach, concat(b, j + 1));
			}
			var _found = false;
			ini_open_from_string(obj_savesystem.ini_str);
			for (i = 0; i < array_length(ach); i++)
			{
				if (ini_read_real("achievements", ach[i], false) == 0)
				{
					_found = true;
					break;
				}
			}
			ini_close();
			if !_found
				palette_unlock(name, "goldemanne", 12, spr_peppattern5);
		}
	}, false, "Palettes", "goldemanne");

	add_achievement_notify("pal_badbones", function()
	{
		achievement_add_variable("badbones_count", 0, true, false);
	}, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.hurt_player
		{
			achievement_get_variable("badbones_count").value += 1;
			if (achievement_get_variable("badbones_count").value >= 50)
				palette_unlock(name, "bones", 12, spr_peppattern6);
		}
	}, false, "Palettes", "bones");

	add_achievement_notify("pal_pp", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.firsttime_ending
		{
			ini_open_from_string(obj_savesystem.ini_str_options);
			var n = ini_read_real("Game", "beaten", 0);
			n++;
			ini_write_real("Game", "beaten", n);
			gamesave_async_save_options();
			obj_savesystem.ini_str_options = ini_close();
			if n >= 2
				palette_unlock(name, "pp", 12, spr_peppattern7);
		}
	}, false, "Palettes", "pp");

	add_achievement_notify("pal_war", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		var arr = data[1];
		if type == notifs.end_level && arr[0] == "war"
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var n = ini_read_real("Attempts", "war", 0);
			ini_close();
			if n <= 1
				palette_unlock(name, "war", 12, spr_peppattern8);
		}
	}, false, "Palettes", "war");

	add_achievement_notify("pal_john", noone, function(data)
	{
		if obj_achievementtracker.character != "P"
			exit;
		
		var type = data[0];
		if type == notifs.johnresurrection && global.file_minutes < 135
			palette_unlock(name, "john", 12, spr_peppattern9);
	}, false, "Palettes", "john");
	
	#endregion
}
