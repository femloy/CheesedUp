if (room != rank_room && minutes <= 0 && seconds <= 0 && addseconds <= 0)
{
	instance_destroy(obj_fadeout);
	with (obj_player)
	{
		targetDoor = "A";
		scr_room_goto(timesuproom);
		state = states.timesup;
		sprite_index = spr_Timesup;
		image_index = 0;
		stop_music();
		audio_stop_all();
	}
	instance_create(0, 0, obj_timesupwar);
	instance_destroy();
}
