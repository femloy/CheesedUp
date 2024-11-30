if paused and keyboard_check_pressed(ord("escape")) {
	instance_destroy(id);
	with obj_player
		targetRoom = Realtitlescreen;
	scr_room_goto(Realtitlescreen);
	with (obj_player1)
	{
		character = "P";
		scr_characterspr();
	}
}
