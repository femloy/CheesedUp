function scr_get_rank()
{
	if MOD.EasyMode
		return "f";
	else if global.timeattack
	{
		if global.tatime <= global.tasrank
			return scr_is_p_rank() ? "p" : "s";
		else if global.tatime <= global.taarank
			return "a";
		else if global.tatime <= global.tabrank
			return "b";
		else if global.tatime <= global.tacrank
			return "c";
		else
			return "d";
	}
	else if global.collect + global.collectN >= global.srank
		return scr_is_p_rank() ? "p" : "s";
	else if global.collect + global.collectN > global.arank
		return "a";
	else if global.collect + global.collectN > global.brank
		return "b";
	else if global.collect + global.collectN > global.crank
		return "c";
	else
		return "d";
}
function scr_savescore(level, do_save)
{
	global.rank = scr_get_rank();
	scr_play_rank_music();
	
	if global.saveloaded && !do_save && global.rank == "f"
	{
		ini_open_from_string(obj_savesystem.ini_str);
		scr_write_rank(level);
		obj_savesystem.ini_str = ini_close();
	}
	
	if global.saveloaded && do_save
	{
		trace("[scr_savescore] Saving to: ", get_savefile_ini());
		
		ini_open_from_string(obj_savesystem.ini_str);
		ini_write_real("Game", "pizzacoin", global.pizzacoin);
		
		// global stats
		if global.timeattack
		{
			level += "-timed";
			
			var current = ini_read_real("Highscore", level, -1);
			if current == -1 or current > global.tatime
				ini_write_real("Highscore", level, global.tatime);
		}
		else
		{
			ini_write_real("Game", "laps", ini_read_real("Game", "laps", 0) + global.laps + 1);
			ini_write_real("Game", "retries", ini_read_real("Game", "retries", 0) + global.levelattempts);
			
			if DEATH_MODE
			{
				if MOD.DeathMode
					level += "-death";
			}
		
			ini_write_real("Attempts", level, ini_read_real("Attempts", level, 0) + global.levelattempts + 1);
			ini_write_real("Laps", level, ini_read_real("Laps", level, 0) + global.laps);
		
			if ini_read_real("Lapscore", level, 0) < global.laps
				ini_write_real("Lapscore", level, global.laps);
		
			global.levelattempts = 0;
		
			if ini_read_real("Highscore", level, 0) < global.collect
				ini_write_real("Highscore", level, global.collect);
			if ini_read_real("Treasure", level, 0) == 0
				ini_write_real("Treasure", level, global.treasure);
		
			var _enemies = ini_read_real("Game", "enemies", 0);
			ini_write_real("Game", "enemies", _enemies + global.enemykilled);
			var _damage = ini_read_real("Game", "damage", 0);
			ini_write_real("Game", "damage", _damage + global.player_damage);
		
			if global.secretfound > 3
				global.secretfound = 3;
			if ini_read_real("Secret", level, 0) < global.secretfound
				ini_write_string("Secret", level, global.secretfound);
		
			global.newtoppin[0] = false;
			global.newtoppin[1] = false;
			global.newtoppin[2] = false;
			global.newtoppin[3] = false;
			global.newtoppin[4] = false;
			
			if !ini_read_real("Toppin", level + "1", false)
			{
				if global.shroomfollow
					global.newtoppin[0] = true;
				ini_write_real("Toppin", level + "1", global.shroomfollow);
			}
			if !ini_read_real("Toppin", level + "2", false)
			{
				if global.cheesefollow
					global.newtoppin[1] = true;
				ini_write_real("Toppin", level + "2", global.cheesefollow);
			}
			if !ini_read_real("Toppin", level + "3", false)
			{
				if global.tomatofollow
					global.newtoppin[2] = true;
				ini_write_real("Toppin", level + "3", global.tomatofollow);
			}
			if !ini_read_real("Toppin", level + "4", false)
			{
				if global.sausagefollow
					global.newtoppin[3] = true;
				ini_write_real("Toppin", level + "4", global.sausagefollow);
			}
			if !ini_read_real("Toppin", level + "5", false)
			{
				if global.pineapplefollow
					global.newtoppin[4] = true;
				ini_write_real("Toppin", level + "5", global.pineapplefollow);
			}
		}
		
		scr_write_rank(level);
		obj_savesystem.ini_str = ini_close();
	}
	else
		global.levelattempts = 0;
}
function scr_play_rank_music()
{
	if global.jukebox != noone
		exit;
	
	var s = 4.5;
	switch global.rank
	{
		case "p": s = 5.5; break;
		case "s": s = 0.5; break;
		case "a": s = 1.5; break;
		case "b": s = 2.5; break;
		case "c": s = 3.5; break;
	}
	
	if ((room != tower_entrancehall || global.exitrank) && global.leveltosave != "tutorial")
	{
		fmod_event_instance_play(global.snd_rank);
		fmod_event_instance_set_parameter(global.snd_rank, "rank", s, true);
	}
}
function scr_write_rank(level)
{
	var _rank = ini_read_string("Ranks", level, "d");
	
	var _map = ds_map_create();
	ds_map_set(_map, "f", -1);
	ds_map_set(_map, "d", 0);
	ds_map_set(_map, "c", 1);
	ds_map_set(_map, "b", 2);
	ds_map_set(_map, "a", 3);
	ds_map_set(_map, "s", 4);
	ds_map_set(_map, "p", 5);
	
	if ds_map_find_value(_map, global.rank) >= ds_map_find_value(_map, _rank)
		ini_write_string("Ranks", level, global.rank);
	
	ds_map_destroy(_map);
}
