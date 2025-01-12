targetRoom = tower_entrancehall;
targetDoor = "C";

if obj_player1.character == "N" && !global.swapmode
{
	var dohouse = true;
	if !global.sandbox
	{
		if gamesave_open_ini()
		{
			dohouse = ini_read_string("Game", "finalrank", "none") != "none";
			gamesave_close_ini(false);
		}
	}
	
	if dohouse
	{
		targetRoom = tower_peppinohouse;
		instance_create(0, 0, obj_puff_house);
	}
}
