function scr_achievements_graveyard()
{
	add_achievement_notify("graveyard1", function(data)
	{
		achievement_add_variable("grav1hurt", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.johnghost_collide && global.leveltosave == "graveyard"
			achievement_get_variable("grav1hurt").value = true;
		else if type == notifs.end_level && arr[0] == "graveyard" && achievement_get_variable("grav1hurt").value == 0
			achievement_unlock(name, "Ghosted", spr_achievement_graveyard, 0);
	});

	add_achievement_notify("graveyard2", function(data)
	{
		achievement_add_variable("grav2count", false, false, true);
	}, function(data)
	{
		var type = data[0];
		if global.leveltosave == "graveyard"
		{
			if type == notifs.baddie_kill && (obj_player1.state == states.ghost || (obj_player1.state == states.chainsaw && obj_player1.tauntstoredstate == states.ghost))
			{
				achievement_get_variable("grav2count").value += 1;
				if achievement_get_variable("grav2count").value >= 20
					achievement_unlock(name, "Pretend Ghost", spr_achievement_graveyard, 1);
			}
		}
	});

	add_achievement_notify("graveyard3", function(data)
	{
		achievement_add_variable("grav3count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		if type == notifs.corpsesurf && global.leveltosave == "graveyard"
		{
			achievement_get_variable("grav3count").value += 1;
			if achievement_get_variable("grav3count").value >= 10
				achievement_unlock(name, "Alive and Well", spr_achievement_graveyard, 2);
		}
	});
}
