if (!is_holiday(holiday.halloween) && (seasonal or !cyop))
or in_saveroom()
{
    instance_destroy(id, false);
	exit;
}

var r = string_letters(room_get_name(room));
trickytreat = r == "trickytreat" || r == "trickytreatb";

if quick_ini_read_real("", "halloween", room_get_name(room), false)
{
    image_alpha = 0.5;
    active = false;
	if !trickytreat
		instance_destroy(id, false);
}
