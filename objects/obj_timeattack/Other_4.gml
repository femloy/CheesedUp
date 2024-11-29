live_auto_call;

with obj_player
{
	if targetDoor == "TIMED"
	{
		global.timeattack = true;
		global.tatime = 0;
		global.prank_cankillenemy = true;
		instance_create(exitgate_x, exitgate_y, obj_lapportalentrance);
		scr_level_gimmicks_persist();
		
		switch global.leveltosave
		{
			case "entrance":
				global.tasrank = ((1 * 60) + 40) * 60; // 1:40
				break;
			case "medieval":
				global.tasrank = ((2 * 60) + 25) * 60; // 2:25
				break;
			case "ruin":
				global.tasrank = ((2 * 60) + 20) * 60; // 2:20
				break;
			case "dungeon":
				global.tasrank = ((2 * 60) + 55) * 60; // 2:55
				break;
			
			case "badland":
				global.tasrank = ((2 * 60) + 45) * 60; // 2:45
				break;
			case "graveyard":
				global.tasrank = ((2 * 60) + 50) * 60; // 2:50
				break;
			case "farm":
				global.tasrank = ((2 * 60) + 15) * 60; // 2:15
				break;
			case "saloon":
				global.tasrank = ((2 * 60) + 45) * 60; // 2:45
				break;
			
			case "plage":
				global.tasrank = ((2 * 60) + 50) * 60; // 2:50
				break;
			case "forest":
				global.tasrank = ((4 * 60) + 25) * 60; // 4:25
				break;
			case "space":
				global.tasrank = ((2 * 60) + 25) * 60; // 2:25
				break;
			case "minigolf":
				global.tasrank = ((2 * 60) + 30) * 60; // 2:30
				break;
			
			case "street":
				global.tasrank = ((2 * 60) + 25) * 60; // 2:25
				break;
			case "industrial":
				global.tasrank = ((2 * 60) + 55) * 60; // 2:55
				break;
			case "sewer":
				global.tasrank = ((4 * 60) + 20) * 60; // 4:20
				break;
			case "freezer":
				global.tasrank = ((3 * 60) + 55) * 60; // 3:55
				break;
			
			case "chateau":
				global.tasrank = ((2 * 60) + 50) * 60; // 2:50
				break;
			case "kidsparty":
				global.tasrank = ((3 * 60) + 15) * 60; // 3:15
				break;
			case "war":
				global.tasrank = ((2 * 60) + 40) * 60; // 2:40
				break;
			
			default:
				global.tasrank = 10 * 60; // 0:10
				break;
		}
		global.taarank = floor(global.tasrank * 1.25);
		global.tabrank = floor(global.taarank * 1.2);
		global.tacrank = floor(global.tabrank * 1.15);
	}
}
