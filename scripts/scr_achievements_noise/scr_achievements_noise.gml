function scr_achievements_noise()
{
	#region PALETTES
	
	add_achievement_update("pal_boise", 1, function()
	{
		achievement_add_variable("boise_prevstate", 0);
		achievement_add_variable("boise_count", 0);
	}, function()
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var _state = achievement_get_variable("boise_prevstate");
		var _count = achievement_get_variable("boise_count");
		if obj_player1.state != _state.value && obj_player1.state != states.chainsaw
		{
			if obj_player1.state == states.ratmountbounce
				_count.value += 0.5;
			else if (_count.value > 0 && (obj_player1.sprite_index == spr_playerN_sidewayspin || obj_player1.sprite_index == spr_playerN_sidewayspinend))
				_count.value += 0.5;
			if _count.value >= 3
				palette_unlock(name, "boise", 3, noone, "N");
			_state.value = obj_player1.state;
		}
		if obj_player1.grounded || (obj_player1.state != states.ratmountbounce && obj_player1.state != states.chainsaw && obj_player1.sprite_index != spr_playerN_sidewayspin && obj_player1.sprite_index != spr_playerN_sidewayspinend)
			_count.value = 0;
	}, false, "Palettes", "boise");

	add_achievement_notify("pal_roise", function()
	{
		achievement_add_variable("roise_count", 0);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		var count = achievement_get_variable("roise_count");
		if type == notifs.cancel_noisedrill
			count.value = 0;
		else if type == notifs.baddie_kill && (obj_player1.sprite_index == spr_playerN_divebomb || obj_player1.sprite_index == spr_playerN_divebombfall || obj_player1.sprite_index == spr_playerN_divebombland)
		{
			count.value++;
			if count.value >= 4
				palette_unlock(name, "roise", 4, noone, "N");
		}
	}, false, "Palettes", "roise");

	add_achievement_notify("pal_poise", function()
	{
		achievement_add_variable("poise_count", 0, false, true);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		var count = achievement_get_variable("poise_count");
		if type == notifs.gate_taunt
			count.value++;
		else if type == notifs.end_level && global.rank == "p" && count.value >= 10
			palette_unlock(name, "poise", 5, noone, "N");
	}, false, "Palettes", "poise");

	add_achievement_notify("pal_reverse", noone, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		if type == notifs.end_level && global.rank == "d" && global.leveltosave == "entrance"
			palette_unlock(name, "reverse", 6, noone, "N");
	}, false, "Palettes", "reverse");

	var pats = [
		["critic", 7, boss_pepperman],
		["outlaw", 8, boss_vigilante],
		["antidoise", 9, boss_noise],
		["flesheater", 10, boss_fakepep],
		["super", 11, boss_pizzafacehub]
	];
	for (var i = 0; i < array_length(pats); i++)
	{
		var pat = pats[i];
		var p = add_achievement_notify(concat("pal_", pat[0]), function()
		{
			achievement_add_variable("count", 0, false, true);
		},
		function(data)
		{
			if obj_achievementtracker.character != "N"
				exit;
			
			var type = data[0];
			var arr = data[1];
			var count = achievement_get_variable("count");
			if type == notifs.player_explosion
				count.value++;
			else if type == notifs.boss_dead && arr[0] == pattern[2] && count.value <= 0
				palette_unlock(name, pattern[0], pattern[1], noone, "N");
		}, false, "Palettes", pat[0]);
		
		if !is_undefined(p) && !p.unlocked
			p.pattern = pat;
	}

	add_achievement_notify("pal_porcupine", noone, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		var arr = data[1];
		if type == notifs.endingrank && arr[0] == "quick"
			palette_unlock(name, "porcupine", 15, noone, "N");
	}, false, "Palettes", "porcupine");

	add_achievement_notify("pal_feminine", noone, function(data)
	{
		if obj_achievementtracker.character != "N" && !global.swapmode
			exit;
	
		var type = data[0];
		if type == notifs.mrmooney_donated
			palette_unlock(name, "feminine", 16, noone, "N");
	}, false, "Palettes", "feminine");

	add_achievement_update("pal_realdoise", 2, noone, function()
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		if obj_player1.state == states.normal && obj_player1.sprite_index == obj_player1.spr_breakdance && room == boss_pizzaface && instance_exists(obj_noiseboss)
			palette_unlock(name, "realdoise", 17, noone, "N");
	}, false, "Palettes", "realdoise");

	add_achievement_notify("pal_forest", function()
	{
		achievement_add_variable("forest_count", 0, false, true);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
		var type = data[0];
		var arr = data[1];
		var count = achievement_get_variable("forest_count");
		if type == notifs.baddie_kill && arr[2] == obj_noisegoblin
			count.value++;
		else if type == notifs.end_level && arr[0] == "forest" && count.value <= 0
			palette_unlock(name, "forest", 18, noone, "N");
	}, false, "Palettes", "forest");

	#endregion
	#region PATTERNS
	
	add_achievement_notify("pal_racer", noone, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		if type == notifs.firsttime_ending
		{
			var game = scr_get_game();
			var noise_secs = (global.file_minutes * 60) + global.file_seconds;
			var pep_secs = (game.minutes * 60) + game.seconds;
			if game.judgement != "none" && noise_secs < pep_secs
				palette_unlock(name, "racer", 28, spr_noisepattern1, "N");
		}
	}, false, "Palettes", "racer");

	add_achievement_update("pal_comedian", 1, function()
	{
		achievement_add_variable("comedian_count", 0, false, false);
	}, function()
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var count = achievement_get_variable("comedian_count");
		var arr = [obj_pepperman, obj_vigilanteboss, obj_noiseboss, obj_fakepepboss, obj_pizzafaceboss, obj_pizzafaceboss_p2, obj_pizzafaceboss_p3];
		var found = false;
		for (var i = 0; i < array_length(arr); i++)
		{
			if (instance_exists(arr[i]))
			{
				found = true;
				break;
			}
		}
		if !found
		{
			count.value = 0;
			exit;
		}
		if obj_player1.sprite_index == obj_player1.spr_breakdance
		{
			count.value++;
			if count.value >= 600
				palette_unlock(name, "comedian", 27, spr_noisepattern2, "N");
		}
		else
			count.value = 0;
	}, false, "Palettes", "comedian");

	add_achievement_notify("pal_banana", function()
	{
		achievement_add_variable("banana_count", 0, true, false);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		var count = achievement_get_variable("banana_count");
		if type == notifs.slipbanan
		{
			count.value++;
			if count.value >= 10
				palette_unlock(name, "banana", 26, spr_noisepattern3, "N");
		}
	}, false, "Palettes", "banana");

	add_achievement_update("pal_noiseTV", 1, noone, function()
	{
		if !instance_exists(obj_tv) || obj_achievementtracker.character != "N"
			exit;
	
		if obj_tv.idlespr == spr_tv_exprheatN
			palette_unlock(name, "noiseTV", 25, spr_noisepattern4, "N");
	}, false, "Palettes", "noiseTV");

	add_achievement_notify("pal_madman", noone, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		if type == notifs.close_call
			palette_unlock(name, "madman", 24, spr_noisepattern5, "N");
	}, false, "Palettes", "madman");

	add_achievement_notify("pal_bubbly", function()
	{
		achievement_add_variable("bubbly_count", 0, false, true);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		var arr = data[1];
		var count = achievement_get_variable("bubbly_count");
		if type == notifs.antigrav && arr[0] == "space"
		{
			count.value++;
			if count.value >= 21
				palette_unlock(name, "bubbly", 23, spr_noisepattern6, "N");
		}
	}, false, "Palettes", "bubbly");

	add_achievement_notify("pal_welldone", function()
	{
		achievement_add_variable("welldone_count", 0, false, true);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
	
		var type = data[0];
		var arr = data[1];
		var count = achievement_get_variable("welldone_count");
		if type == notifs.cow_kick_count && arr[0] == "badland"
		{
			count.value++;
			if count.value >= 45
				palette_unlock(name, "welldone", 22, spr_noisepattern7, "N");
		}
	}, false, "Palettes", "welldone");

	add_achievement_notify("pal_grannykisses", function()
	{
		achievement_add_variable("granny_hubtips1", false, true, false);
		achievement_add_variable("granny_hubtips2", false, true, false);
		achievement_add_variable("granny_hubtips3", false, true, false);
		achievement_add_variable("granny_hubtips4", false, true, false);
		achievement_add_variable("granny_hubtips5", false, true, false);
		achievement_add_variable("granny_hubtips6", false, true, false);
		achievement_add_variable("granny_hubtips7N", false, true, false);
		achievement_add_variable("granny_hubtips8", false, true, false);
		achievement_add_variable("granny_hubtips9", false, true, false);
		achievement_add_variable("granny_garbage1N", false, true, false);
		achievement_add_variable("granny_garbage2N", false, true, false);
		achievement_add_variable("granny_garbage3", false, true, false);
		achievement_add_variable("granny_garbage4", false, true, false);
		achievement_add_variable("granny_garbage5N", false, true, false);
		achievement_add_variable("granny_garbage6", false, true, false);
		achievement_add_variable("granny_garbage7N", false, true, false);
		achievement_add_variable("granny_garbage8", false, true, false);
		achievement_add_variable("granny_garbage9", false, true, false);
		achievement_add_variable("granny_garbage10", false, true, false);
		achievement_add_variable("granny_garbage11", false, true, false);
		achievement_add_variable("granny_garbage12", false, true, false);
		achievement_add_variable("granny_garbage13", false, true, false);
		achievement_add_variable("granny_garbage14", false, true, false);
		achievement_add_variable("granny_garbage15", false, true, false);
		achievement_add_variable("granny_forest1N", false, true, false);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
		
		var type = data[0];
		var arr = data[1];
		if type == notifs.interact_granny
		{
			var b = achievement_get_variable(concat("granny_", arr[0]));
			if !is_undefined(b)
			{
				b.value = true;
				var vals = achievement_get_all_variables();
				var found = false;
				for (var i = 0; i < array_length(vals); i++)
				{
					if !vals[i].value
					{
						found = true;
						break;
					}
				}
				if !found
					palette_unlock(name, "grannykisses", 21, spr_noisepattern8, "N");
			}
		}
	}, false, "Palettes", "grannykisses");

	add_achievement_notify("pal_towerguy", function()
	{
		achievement_add_variable("towerguy_entrance", false, true, false);
		achievement_add_variable("towerguy_medieval", false, true, false);
		achievement_add_variable("towerguy_ruin", false, true, false);
		achievement_add_variable("towerguy_dungeon", false, true, false);
		achievement_add_variable("towerguy_badland", false, true, false);
		achievement_add_variable("towerguy_graveyard", false, true, false);
		achievement_add_variable("towerguy_farm", false, true, false);
		achievement_add_variable("towerguy_saloon", false, true, false);
		achievement_add_variable("towerguy_plage", false, true, false);
		achievement_add_variable("towerguy_forest", false, true, false);
		achievement_add_variable("towerguy_minigolf", false, true, false);
		achievement_add_variable("towerguy_space", false, true, false);
		achievement_add_variable("towerguy_street", false, true, false);
		achievement_add_variable("towerguy_sewer", false, true, false);
		achievement_add_variable("towerguy_freezer", false, true, false);
		achievement_add_variable("towerguy_industrial", false, true, false);
		achievement_add_variable("towerguy_war", false, true, false);
		achievement_add_variable("towerguy_kidsparty", false, true, false);
		achievement_add_variable("towerguy_chateau", false, true, false);
		achievement_add_variable("towerguy_exit", false, true, false);
	}, function(data)
	{
		if obj_achievementtracker.character != "N"
			exit;
		
		var type = data[0];
		var arr = data[1];
		if type == notifs.seen_ptg
		{
			var b = achievement_get_variable(concat("towerguy_", arr[0]));
			if !is_undefined(b)
			{
				b.value = true;
				var vals = achievement_get_all_variables();
				var found = false;
				for (var i = 0; i < array_length(vals); i++)
				{
					if !vals[i].value
					{
						found = true;
						break;
					}
				}
				if !found
					palette_unlock(name, "towerguy", 20, spr_noisepattern9, "N");
			}
		}
	}, false, "Palettes", "towerguy");
	
	#endregion
}
