if instance_number(object_index) > 1
	exit;

if room == boss_pepperman || room == tower_pizzafacehall || instance_exists(obj_achievementviewer)
	visible = false;
else
	visible = true;

if global.panic
	instance_destroy();
else
{
	global.pigtotal = 0;
	global.pigreduction = 0;
	
	if !global.sandbox && gamesave_open_ini()
	{
		var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
		for (var i = 0; i < array_length(levels); i++)
		{
			var b = levels[i];
			for (var j = 0; j < 5; j++)
			{
				if ini_read_real("Toppin", concat(b, j + 1), false)
					global.pigtotal += 10;
			}
		}
		var _worlds = ["w1stick", "w2stick", "w3stick", "w4stick", "w5stick"];
		for (i = 0; i < array_length(_worlds); i++)
		{
			b = _worlds[i];
			var r = ini_read_real(b, "reduction", 0);
			if r > 0 && global.stickreq[i] != r
			{
				ini_write_real(b, "reduction", global.stickreq[i]);
				r = global.stickreq[i];
			}
			global.pigreduction += ini_read_real(b, "reduction", 0);
		}
		if ini_read_real("w5stick", "mooneyunlocked", false)
			instance_destroy();
		gamesave_close_ini(false);
	}
	else
		instance_destroy();
}
