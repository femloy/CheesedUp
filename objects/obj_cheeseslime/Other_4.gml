event_inherited();

if snotty
{
	if global.panic
	{
		add_baddieroom();
		instance_destroy();
	}
	important = true;
	
	ini_open_from_string(obj_savesystem.ini_str);
	if ini_read_real("Game", "snotty", false)
	{
		add_baddieroom();
		instance_destroy();
		if !global.panic
			instance_create(x, y, obj_snotty);
	}
	ini_close();
}
