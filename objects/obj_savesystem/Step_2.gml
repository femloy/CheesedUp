if state == 0 && dirty
{
	if savegame
	{
		savegame = false;
		if global.saveloaded
		{
			state = 1;
			with obj_achievementtracker
			{
				achievement_save_variables(achievements_update);
				achievement_save_variables(achievements_notify);
			}
			showicon = true;
			icon_alpha = 3;
			savebuff = buffer_create(1, buffer_grow, 1);
			ini_open_from_string(ini_str);
			ini_write_real("Game", "percent", get_percentage());
			ini_write_real("Game", "minutes", global.file_minutes);
			ini_write_real("Game", "seconds", global.file_seconds);
			var closestring = ini_close();
			buffer_write(savebuff, buffer_string, closestring);
			
			var save_location = concat(get_save_folder(), "/", get_savefile_ini());
			saveid = buffer_save_async(savebuff, save_location, 0, buffer_get_size(savebuff));
			
			trace("[obj_savesystem] Saved at ", save_location);
		}
	}
	else if saveoptions
	{
		saveoptions = false;
		state = 3;
		savebuff = buffer_create(1, buffer_grow, 1);
		showicon = true;
		icon_alpha = 3;
		buffer_write(savebuff, buffer_string, ini_str_options);
		saveid = buffer_save_async(savebuff, game_save_id + "saveData.ini", 0, buffer_get_size(savebuff));
	}
	else
		dirty = false;
}
