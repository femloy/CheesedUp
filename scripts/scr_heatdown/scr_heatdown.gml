function scr_heatdown()
{
	global.baddiespeed -= 1;
	if (global.stylethreshold != 2)
		global.baddiepowerup = false;
	if (global.stylethreshold < 2)
	{
		global.baddierage = false;
		obj_heatafterimage.visible = false;
	}
	//if (instance_exists(obj_baddie))
		old_hud_message(lstr("message_heatdown"), 200);
	obj_stylebar.toggle = true;
	obj_stylebar.alarm[0] = 5;
}
