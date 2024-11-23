function scr_heatup()
{
	global.baddiespeed += 1;
	if (global.stylethreshold == 2)
		global.baddiepowerup = true;
	if (global.stylethreshold >= 2)
	{
		global.baddierage = true;
		obj_heatafterimage.visible = true;
	}
	old_hud_message(lstr("message_heatup"), 200);
	with obj_stylebar
	{
		toggle = true;
		alarm[0] = 5;
	}
}
