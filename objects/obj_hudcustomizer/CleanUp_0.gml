live_auto_call;

ini_open_from_string(obj_savesystem.ini_str_options);
ini_write_real("Modded", "minimal_pad", global.minimal_pad);
ini_write_real("Modded", "minimal_rankspot", global.minimal_rankspot);
ini_write_real("Modded", "minimal_combospot", global.minimal_combospot);
obj_savesystem.ini_str_options = ini_close();
