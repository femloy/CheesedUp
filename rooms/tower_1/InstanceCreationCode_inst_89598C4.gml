var found = false;

ini_open_from_string(obj_savesystem.ini_str_options);
if ini_read_real("Modded", "sighting", false) && (!keyboard_check(ord("E")) or !DEBUG)
{
	layer_depth("Tiles_Secret1", 80);
	instance_destroy();
	instance_destroy(obj_fakeplayer);
	
	found = true;
}
obj_savesystem.ini_str_options = ini_close();

if !found
	event_user(0);
