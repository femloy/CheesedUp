if !in_saveroom()
{
	add_saveroom();
	scr_sound_multiple(global.snd_collect, x, y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime = 60;
	global.collect += 50;
	with instance_create(x, y, obj_smallnumber)
		number = string(50);
	create_particle(x, y, part.genericpoofeffect, 0);
}
