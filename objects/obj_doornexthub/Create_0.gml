// checks if you beat the game on this savefile
if !instance_exists(obj_cyop_loader)
{
	var unlock = false;
	if global.sandbox or instance_exists(obj_elevatorcutscene)
		unlock = true;
	else
	{
		ini_open_from_string(obj_savesystem.ini_str);
		unlock = ini_key_exists("Ranks", "exit");
		ini_close();
	}
	if unlock
	{
		instance_change(obj_hubelevator, true);
		exit;
	}
}

event_inherited();
targetDoor = noone;
key = false;
save = "w1stick";
unlocked = false;
state = states.normal;
depth = 50;
