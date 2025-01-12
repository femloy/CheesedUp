if instance_number(object_index) > 1
{
	instance_destroy();
	exit;
}

depth = -600;

dirty = false;
savegame = false;
saveoptions = false;
fadeoutcreate = false;
showicon = false;
ini_str = "";
state = 0;

icon_index = 0;
icon_spr = spr_pizzaslice;

ini_open(save_folder + "saveData.ini");
ini_str_options = ini_close();

character = "P";
showed_error = false;

global.saveloaded = false;
