if (room == rm_editor)
	exit;
if (obj_player.state != states.hurt && global.pineapplefollow == 0)
{
	global.heattime = 60;
	global.style += 10;
	add_saveroom();
	
	/*
	if (global.toppintotal < 5)
		obj_tv.message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
	if (global.toppintotal == 5)
		obj_tv.message = "YOU HAVE ALL TOPPINS!";
	obj_tv.showtext = true;
	obj_tv.alarm[0] = 150;
	*/
	
	global.toppintotal += 1;
	global.pineapplefollow = true;
	panic = false;
}
