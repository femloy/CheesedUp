/// @description RESTART LEVEL
instance_destroy(obj_option);
instance_destroy(obj_keyconfig);

global.levelreset = false;
scr_playerreset(false, true);
global.levelreset = true;

scr_delete_pause_image();
scr_pause_stop_sounds();

var rm = roomtorestart;
global.levelattempts++;
ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
ds_list_clear(global.debris_list);
ds_list_clear(global.collect_list);
alarm[4] = 1;
with obj_music
	music = noone;
instance_destroy(obj_fadeout);

with obj_player
{
	var _d = "A";
	if rm == boss_pizzaface
		_d = "B";
	if global.timeattack
		_d = "TIMED";
	
	targetRoom = rm;
	targetDoor = _d;
	restartbuffer = 15;
}

if rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante
	global.bossintro = true;

scr_room_goto(rm);
