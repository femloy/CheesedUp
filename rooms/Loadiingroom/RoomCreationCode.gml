global.longintro = true;
if YYC
{
	if !variable_global_exists("_")
	{
		trace("FUNNYROOM - globalvar doesn't exist (Loadiingroom)");
		instance_create(0, 0, obj_softlockcrash);
	}
}

global.swapmode = false; // disclaimer uses input
tdp_text_init();

global.holiday = holiday.none;

var date = date_current_datetime();
var month = date_get_month(date);
var day = date_get_day(date);

if month == 10 || (month == 11 && day <= 14)
    global.holiday = holiday.halloween;

if month == 3 && day >= 8 && day <= 10
	global.holiday = holiday.loy_birthday;
