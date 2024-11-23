if DEATH_MODE
{
	live_auto_call;
	ensure_order;
	
	if !active && MOD.DeathMode
	{
		active = true;
	
		time = room_speed * 11 - 1;
		show_time = room_speed * 2;
		dead = false;
		time_fx = 0;
		time_fx_y = 0;
		ybump = 0;
		surfy = 60;
		surfscale = 0.5;
		image_speed = .35;
	
		if check_char("G")
			time += room_speed * 5;
	}
	depth = obj_parallax.behind_tile_depth;
}
