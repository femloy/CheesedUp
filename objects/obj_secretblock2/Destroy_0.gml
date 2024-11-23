if !in_saveroom()
{
	create_baddiegibsticks(x + 16, y + 16);
	scr_sound_multiple(global.snd_collect, x, y);
	
	global.heattime = clamp(global.heattime + 10, 0, 60);
	global.combotime = clamp(global.combotime + 10, 0, 60);
	
	if !global.snickchallenge
	{
		var val = heat_calculate(10);
		global.collect += val;
		with instance_create(x + 16, y, obj_smallnumber)
			number = string(val);
	}
}
event_inherited();
