//if !showswap

{
	global.swapmode = false;
	with obj_player1
	{
		character = "";
		isgustavo = false;
		noisecrusher = false;
		noisetype = noisetype.base;
	}
	scr_start_game(currentselect + 1, charselect == 0);
}

/*
else
{
	var grouparr = ["characterselectgroup"];
	with obj_player
	{
		targetRoom = characterselect;
		targetDoor = "A";
		state = states.titlescreen;
	}
	global.swapmode = true;
	
	with instance_create(0, 0, obj_fadeout)
		group_arr = grouparr;
}
*/
