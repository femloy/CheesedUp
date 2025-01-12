if !first
{
	if distance_to_object(obj_player) < 300 && obj_player.y > y - 100
	{
		first = true;
		
		if gamesave_open_ini()
		{
			ini_write_real(save, "first", true);
			gamesave_close_ini(true);
		}
		
		with instance_create(obj_stick_target.x, camera_get_view_y(view_camera[0]) - 100, obj_stick)
		{
			state = states.fall;
			sprite_index = spr_helicopter;
			maxscore = other.maxscore;
			save = other.save;
		}
	}
}
