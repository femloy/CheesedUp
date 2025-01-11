function scr_achievements_space()
{
	add_achievement_update("space1", 1, function(data)
	{
		achievement_add_variable("sp1_hit", false, false, true);
	},
	function(data)
	{
		if room == space_10
		{
			if instance_exists(obj_fadeout)
			{
				if obj_player1.targetDoor == "B"
					achievement_get_variable("sp1_hit").value = false;
			}
			var b = false;
			with obj_antigravbubble
			{
				if sprite_index == spr_antigrav_bubblesquish
					b = true;
			}
			if b
				achievement_get_variable("sp1_hit").value = true;
			var _q = false;
			with obj_player1
			{
				if y < 608
					_q = true;
			}
			if _q && achievement_get_variable("sp1_hit").value == 0
				achievement_unlock(name, "Turbo Tunnel", spr_achievement_space, 0);
		}
	});

	add_achievement_notify("space2", function(data)
	{
		achievement_add_variable("sp2_count", 0, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if type == notifs.levelblock_break && global.leveltosave == "space" && arr[0] == obj_asteroid
		{
			achievement_get_variable("sp2_count").value += 1;
			if achievement_get_variable("sp2_count").value >= 18
				achievement_unlock(name, "Blast Em Asteroids", spr_achievement_space, 2);
		}
	});
	
	add_achievement_notify("space3", function(data)
	{
		achievement_add_variable("space3count", 0, false, true);
		achievement_add_variable("space3start", false, false, true);
	}, function(data)
	{
		var type = data[0];
		var arr = data[1];
		if global.leveltosave == "space"
		{
			if type == notifs.bodyslam_start
				achievement_get_variable("space3start").value = true;
			else if achievement_get_variable("space3start").value == 1 && type == notifs.baddie_kill && arr[2] == obj_miniufo
			{
				achievement_get_variable("space3count").value += 1;
				trace("Meteor Man Count: ", achievement_get_variable("space3count").value);
				if achievement_get_variable("space3count").value >= 5
					achievement_unlock(name, "Man Meteor", spr_achievement_space, 1);
			}
			else if type == notifs.bodyslam_end
			{
				achievement_get_variable("space3start").value = false;
				achievement_get_variable("space3count").value = 0;
			}
		}
	});
}
