/// @description EXIT LEVEL

/*
	this is called in the loading screen object -Loy
	I should probably improve that at some point
*/

instance_destroy(obj_option);
instance_destroy(obj_keyconfig);

scr_playerreset();

scr_delete_pause_image();
scr_pause_stop_sounds();

// cyop backtohub
if room == editor_entrance
{
	with obj_player
		cyop_backtohubroom = noone;
}
if instance_exists(obj_cyop_loader)
{
	with obj_tv
		tv_bg.sprite = spr_gate_cyopBG;
}

var rm = room;
if !hub or (instance_exists(obj_cyop_loader) && !is_string(obj_player1.backtohubroom))
{
	pause = false;
	if instance_exists(obj_cyop_loader)
	{
		instance_destroy(obj_cyop_loader);
		
		with obj_player
			targetRoom = editor_entrance;
		scr_room_goto(editor_entrance);
	}
	else
	{
		with obj_player
			targetRoom = Realtitlescreen;
		scr_room_goto(Realtitlescreen);
		with obj_player1
		{
			character = "P";
			scr_characterspr();
		}
	}
	
	global.leveltosave = noone;
	global.leveltorestart = noone;
	alarm[0] = 1;
	
	with obj_player
	{
		state = states.titlescreen;
		targetDoor = "A";
	}
	
	global.cowboyhat = false;
	global.coop = false;
}
else
{
	with obj_player1
		swap_player();
	
	if instance_exists(obj_cyop_loader) && is_string(obj_player1.backtohubroom)
	{
		with instance_create(0, 0, obj_backtohub_fadeout)
			fadealpha = .9;
		
		global.levelreset = true;
		cyop_load_level_internal(global.cyop_hub_level, true);
	}
	else
	{
		with instance_create(0, 0, obj_backtohub_fadeout)
		{
			fadealpha = 1;
			fadein = false;
			reset = true;
			pos_player = false;
		}
		
		global.levelreset = true;
		with obj_player
		{
			targetDoor = "HUB";
			targetRoom = backtohubroom;
			room_goto(backtohubroom);
		}
		global.leveltorestart = noone;
		global.leveltosave = noone;
	}
}
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
