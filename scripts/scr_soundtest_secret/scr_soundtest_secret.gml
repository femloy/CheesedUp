function scr_soundtest_secret()
{
	targetRoom = tower_soundtest;
	soundtest = true;
	
	if !global.sandbox
	{
		if gamesave_open_ini()
		{
			var found = false;
			var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
			for (var i = 0; i < array_length(lvl); i++)
			{
				var b = lvl[i];
				if ini_read_real("Secret", b, 0) < 3
				{
					found = true;
					break;
				}
			}
			if ini_read_string("Game", "finalrank", "none") == "none"
				found = true;
			if found
				instance_destroy();
			gamesave_close_ini(false);
		}
	}
	if global.panic
		instance_destroy();
}
