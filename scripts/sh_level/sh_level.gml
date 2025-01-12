function sh_level(args)
{
	if !WC_debug
		return WC_NODEBUG;
	if array_length(args) < 2
		return "Level argument missing";
	isOpen = false;
	
	var level = args[1], targetRoom = -1;
	if instance_exists(obj_cyop_loader)
	{
		level = WCscr_allargs(args, 1);
		var targetLevel = concat(global.cyop_path, "/levels/", level, "/level.ini");
		
		if !file_exists(targetLevel)
			return $"{level} level doesn't exist";
		else
			cyop_load_level_internal(targetLevel, false);
	}
	else
	{
		var _i = level_get_info(level);
		if _i != noone
			targetRoom = _i.gate_room;
		else
			targetRoom = asset_get_index(level + "_1");
		
		if room_exists(targetRoom)
		{
			with obj_player1
			{
				global.exitrank = true;
				global.startgate = true;
				global.leveltosave = level;
				global.leveltorestart = targetRoom;
				global.levelattempts = 0;
				global.levelreset = true;
				backtohubstartx = x;
				backtohubstarty = y;
				backtohubroom = room;
				targetDoor = "A";
			}
			if level == "snickchallenge"
				activate_snickchallenge();
			scr_room_goto(targetRoom);
		}
	}
}
function meta_level()
{
	return {
		description: "travel to a level",
		arguments: ["level"],
		suggestions: [
			function()
			{
				if instance_exists(obj_cyop_loader)
				{
					var levels = [];
					
					var file = file_find_first(concat(global.cyop_path, "/levels/*"), fa_directory);
					while file != ""
					{
						if directory_exists(concat(global.cyop_path, "/levels/", file))
							array_push(levels, file);
						file = file_find_next();
					}
					file_find_close();
					
					return levels;
				}
				else
				{
					var array = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "kidsparty", "chateau", "war", "exit", "secretworld",
						"oldexit", "beach", "mansion", "strongcold", "dragonlair", "etb", "ancient", "grinch", "snickchallenge", "oldfreezer"];
					
					if SUGARY_SPIRE
						array_push(array, "entryway", "steamy", "molasses", "sucrose");
					if BO_NOISE
						array_push(array, "midway");
					
					return array;
				}
			}
		]
	}
}
