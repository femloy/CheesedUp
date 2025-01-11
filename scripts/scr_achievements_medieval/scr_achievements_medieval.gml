function scr_achievements_medieval()
{
	add_achievement_notify("medieval1", function(data)
	{
		achievement_add_variable("med1count", 0, false, true);
		achievement_add_variable("med1hurt", false, false, true);
		achievement_add_variable("med1start", false, false, true);
	},
	function(data)
	{
		var type = data[0];
		if global.leveltosave == "medieval"
		{
			if type == notifs.knighttaken
				achievement_get_variable("med1start").value = true;
			else if type == notifs.knightpep_bump
				achievement_get_variable("med1hurt").value = true;
			else if type == notifs.priest_collect
			{
				if achievement_get_variable("med1start").value == 1 && achievement_get_variable("med1hurt").value == false
					achievement_get_variable("med1count").value += 1;
				if achievement_get_variable("med1count").value >= 5
					achievement_unlock(name, "Shining Armor", spr_achievement_medieval, 0);
				achievement_get_variable("med1hurt").value = false;
			}
		}
	});

	add_achievement_notify("medieval2", function(data)
	{
		achievement_add_variable("med2count", 0, false, true);
	},
	function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.parry && global.leveltosave == "medieval" && arr[1] == obj_forknight
		{
			achievement_get_variable("med2count").value += 1;
			if (achievement_get_variable("med2count").value >= 10)
				achievement_unlock(name, "Spoonknight", spr_achievement_medieval, 1);
		}
	});

	add_achievement_notify("medieval3", noone, function(data)
	{
		var type = data[0];
		if type == notifs.baddie_kill && global.leveltosave == "medieval" && (obj_player1.state == states.tumble || (obj_player1.tauntstoredstate == states.tumble && obj_player1.state == states.chainsaw)) && (obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend || obj_player1.sprite_index == obj_player1.spr_tumble)
			achievement_unlock(name, "Spherical", spr_achievement_medieval, 2);
	});
}
