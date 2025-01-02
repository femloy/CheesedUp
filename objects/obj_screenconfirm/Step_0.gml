ensure_order;

if alarm[1] > -1
	exit;
if buffer > 0
{
	buffer--;
	exit;
}

scr_menu_getinput();
if -key_left2
    select = 0;
else if key_right2
    select = 1;

if key_jump
{
    if select == 0
    {
		// confirm
		if restart
		{
			ini_open_from_string(obj_savesystem.ini_str_options);
			if is_string(saveto)
				ini_write_string(section, key, saveto);
			else
				ini_write_real(section, key, saveto);
	        obj_savesystem.ini_str_options = ini_close();
			gamesave_async_save_options();
			
			// boot up
			if TESTBUILD
			{
				show_message("Rebooting the game doesn't work while testing.\nThe setting HAS been saved, though.");
				instance_destroy();
			}
			else
			{
				var str = "";
				for (var i = 0, n = parameter_count(); i < n; ++i)
				{
					str += parameter_string(i);
					if i < n - 1
						str += " ";
				}
				
				if !file_exists(parameter_string(0)) && !launch_external(str)
				{
					show_message("Failed to reboot the game.\nPlease reboot the game yourself to see any changes.");
					instance_destroy();
				}
				else
					alarm[1] = 5;
			}
		}
		else
		{
	        ini_open_from_string(obj_savesystem.ini_str_options);
	        ini_write_real(section, key, variable_global_get(varname));
	        obj_savesystem.ini_str_options = ini_close();
	        timer = 5;
	        instance_destroy();
		}
    }
    else
    {
		// cancel
        timer = 0;
        event_perform(ev_alarm, 0);
        instance_destroy();
    }
}
