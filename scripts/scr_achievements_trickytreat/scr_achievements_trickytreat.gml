function scr_achievements_trickytreat()
{
	add_achievement_notify("halloween1", -4, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.pumpkin_collect && arr[0] >= 30
			achievement_unlock(name, "Pumpkin Munchkin", spr_achievement_halloween, 0);
	});

	add_achievement_notify("halloween2", function()
	{
		achievement_add_variable("hw2count", 0, false, true);
		achievement_add_variable("hw2start", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		switch type
		{
			case notifs.trickytreat_enter:
				if arr[0] == trickytreat_1
				{
					if achievement_get_variable("hw2count").value >= 10
					{
						achievement_unlock(name, "Tricksy", spr_achievement_halloween, 1);
						with obj_achievementviewer
							event_perform(ev_other, ev_room_start);
					}
					else
						trace("Couldn't get the achievement!, max count: ", achievement_get_variable("hw2count").value);
					achievement_get_variable("hw2count").value = 0;
				}
				break;
		
			case notifs.trickytreat_fail:
				achievement_get_variable("hw2count").value = 0;
				break;
		
			case notifs.pumpkin_collect:
				var r = room_get_name(room);
				if string_starts_with(r, "trickytreat")
				{
					trace("Found pumpkin at: ", room_get_name(room));
					achievement_get_variable("hw2count").value += 1;
				}
				break;
		}
	});
}
