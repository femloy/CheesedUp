function basegame_startup_create(x, y, object)
{
	if instance_exists(object) exit;
	instance_create_depth(x, y, -70, object);
}

function scr_basegame_startup()
{
	basegame_startup_create(576, 352, obj_player1);
	basegame_startup_create(-96, 352, obj_player2);
	
	basegame_startup_create(0, 0, obj_camera);
	basegame_startup_create(0, 0, obj_music);
	basegame_startup_create(0, 0, obj_parallax);
	basegame_startup_create(0, 0, obj_particlesystem);
	basegame_startup_create(0, 0, obj_pause);
	basegame_startup_create(0, 0, obj_tv);
	basegame_startup_create(0, 0, obj_roomname);
	basegame_startup_create(0, 0, obj_hardmode);
	basegame_startup_create(0, 0, obj_timeattack);
	basegame_startup_create(0, 0, obj_drawcontroller);
	basegame_startup_create(0, 0, obj_afterimagecontroller);
	basegame_startup_create(0, 0, obj_stylebar);
	basegame_startup_create(0, 0, obj_heatafterimage);
	basegame_startup_create(0, 0, obj_chunktimer);
	basegame_startup_create(0, 0, obj_secretmanager);
	basegame_startup_create(0, 0, obj_achievementtracker);
	basegame_startup_create(0, 0, obj_globaltimer);
	
	basegame_startup_create(0, 0, obj_cutoffsystem);
	basegame_startup_create(0, 0, obj_pizzacoinindicator);
	basegame_startup_create(0, 0, obj_panicdebris);
	basegame_startup_create(0, 0, obj_inputdisplay);
	basegame_startup_create(0, 0, obj_baddietombcontroller);
	
	global.coop = false;
	global.saveloaded = false;
	global.currentsavefile = 9;
	scr_load_savefiles();
	
	global.levelcomplete = false;
	global.levelattempts = 0;
	
	global.file_laps = 0;
	global.file_retries = 0;
	
	global.stickreq[0] = 100;
	global.stickreq[1] = 150;
	global.stickreq[2] = 200;
	global.stickreq[3] = 200;
	global.stickreq[4] = 210;
	global.levelattempts = 0;
	global.newtoppin = array_create(5, false);
	global.afterimage_color1 = make_colour_rgb(255, 0, 0);
	global.afterimage_color2 = make_colour_rgb(0, 255, 0);
	global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
	global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
	global.pigreduction = 0;
	global.pigtotal = 0;
	
	with obj_player
		state = states.normal;
	
	if DEBUG
	{
		if room != Realtitlescreen
			room_goto(Realtitlescreen);
		global.showcollisions = true;
	}
	else
	{
		instance_destroy(obj_cutscene_handler);
		if global.longintro
			room_goto(Longintro);
		else
			room_goto(Mainmenu);
	}
	global.longintro = false;
}
