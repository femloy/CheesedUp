function scr_preload_startup()
{
	if instance_exists(obj_player)
		game_restart();
	else
	{
		global.longintro = true;
		global.titlecutscene = true;
	
		global.holiday = holiday.none;
	
		var date = date_current_datetime();
		var month = date_get_month(date);
		var day = date_get_day(date);

		if month == 10 || (month == 11 && day <= 14)
		    global.holiday = holiday.halloween;
		if month == 3 && day >= 8 && day <= 10
			global.holiday = holiday.loy_birthday;
	
		global.goodmode = false;
		global.sandbox = true;
	}
}
