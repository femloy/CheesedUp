function add_secrets_achievement(secret, levelarray)
{
	var b = add_achievement_notify(concat("secrets", secret), noone, function(achievement)
	{
		var type = achievement[0];
		if type == notifs.end_level
		{
			if gamesave_open_ini()
			{
				var n = levelarray;
				var _unfinished = false;
				for (var i = 0; i < array_length(n); i++)
				{
					var b = n[i];
					var s = ini_read_real("Secret", b, 0);
					if s < 3
						_unfinished = true;
				}
				gamesave_close_ini(false);
				if !_unfinished
					achievement_unlock(name, noone, spr_achievement_farm, 0);
			}
		}
	});
	
	b.levelarray = levelarray;
}
function add_rank_achievements(world, rank, sprite, index, levelarray)
{
	var b = add_achievement_notify(concat(rank, "ranks", world), noone, function(achievement)
	{
		var type = achievement[0];
		if type == notifs.end_level
		{
			if gamesave_open_ini()
			{
				var n = levelarray;
				var _finished = true;
				var map = ds_map_create();
				ds_map_set(map, "d", 0);
				ds_map_set(map, "c", 1);
				ds_map_set(map, "b", 2);
				ds_map_set(map, "a", 3);
				ds_map_set(map, "s", 4);
				ds_map_set(map, "p", 5);
				for (var i = 0; i < array_length(n); i++)
				{
					var b = n[i];
					var s = ini_read_string("Ranks", b, "d");
					if ds_map_find_value(map, s) < ds_map_find_value(map, rank)
						_finished = false;
				}
				ds_map_destroy(map);
				gamesave_close_ini(false);
				if _finished
					achievement_unlock(name, "", sprite, index);
			}
		}
	});
	
	b.rank = rank;
	b.levelarray = levelarray;
	b.sprite = sprite;
	b.index = index;
}
function add_boss_achievements(boss, bossroom, sprite, index)
{
	var b = add_achievement_notify(boss, noone, function(achievement)
	{
		var type = achievement[0];
		var arr = achievement[1];
		if (type == notifs.boss_dead && arr[0] == bossroom && !global.bossplayerhurt)
			achievement_unlock(name, "", sprite, index);
	});
	
	b.sprite = sprite;
	b.index = index;
	b.bossroom = bossroom;
}
function scr_custom_notification_destructibles()
{
	active = false;
	step = function()
	{
		if (!active)
		{
			if (!place_meeting(x, y, obj_destructibles))
			{
				active = true;
				notification_push(notifs.destroyed_area, [room]);
			}
		}
	};
}
