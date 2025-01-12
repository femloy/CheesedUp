function scr_start_game_fresh(slot, sandbox)
{
	global.swapmode = false;
	with obj_player1
	{
		character = "";
		isgustavo = false;
		noisecrusher = false;
		noisetype = noisetype.base;
	}
	scr_start_game(slot, sandbox);
}

function scr_start_game(slot, sandbox = global.sandbox)
{
	// currentsavefile - counts from 1, not 0
	
	instance_create(0, 0, obj_fadeout);
	with obj_player
	{
		targetRoom = hub_loadingscreen;
		targetDoor = "A";
	}
	global.sandbox = sandbox;
	global.currentsavefile = slot;
	gamesave_async_load();
}
