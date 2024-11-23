function scr_start_game(slot, sandbox = global.sandbox)
{
	// currentsavefile - counts from 1, not 0
	
	instance_create(x, y, obj_fadeout);
	with obj_player
	{
		targetRoom = hub_loadingscreen;
		targetDoor = "A";
	}
	global.sandbox = sandbox;
	global.currentsavefile = slot;
	gamesave_async_load();
}
