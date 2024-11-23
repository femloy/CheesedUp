var ident = ds_map_find_value(async_load, "id");
var status = ds_map_find_value(async_load, "status");
//var error = ds_map_find_value(async_load, "error");

switch (state)
{
	case 1:
	case 3:
		if ident == saveid
		{
			buffer_delete(savebuff);
			trace("Save status: ", status);
			if status == false && !showed_error
			{
				showed_error = true;
				
				audio_play_sound(sfx_pephurt, 0, false);
				show_message("The game failed to save!");
			}
			state = 0;
		}
		break;
	
	case 2:
		if ident == loadid
		{
			var buffstring = buffer_read(loadbuff, buffer_string);
			
			ini_open_from_string(buffstring);
			with obj_achievementtracker
			{
				achievements_load(achievements_update);
				achievements_load(achievements_notify);
			}
			global.file_minutes = ini_read_real("Game", "minutes", 0);
			global.file_seconds = ini_read_real("Game", "seconds", 0);
			ini_str = ini_close();
			
			buffer_delete(loadbuff);
			state = 0;
			global.saveloaded = true;
			
			trace("[obj_savesystem] Loaded: ", get_savefile_ini());
		}
		break;
}
