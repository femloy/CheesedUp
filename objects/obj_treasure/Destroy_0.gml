if (got && player != 0)
{
	var val = 3000;
	if check_lap_mode(LAP_MODES.april)
		val *= 2;
	
	global.collect += val;
	global.combotime = 60;
	
	with instance_create(x + 16, y, obj_smallnumber)
		number = string(val);
	
	if check_lap_mode(LAP_MODES.april)
		scr_do_exitgate();
}
instance_destroy(effectid);
