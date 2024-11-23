global.levelcomplete = true;
global.noisejetpack = false;
global.pistol = false;
global.levelreset = false;
global.snickchallenge = false;
scr_playerreset();

global.exitrank = false;
global.leveltorestart = noone;
global.leveltosave = noone;
global.level_minutes = 0;
global.level_seconds = 0;

var _r = obj_player1.backtohubroom;
if instance_exists(obj_cyop_loader)
{
	if (global.cyop_is_hub or global.cyop_hub_level == "")
	{
		_r = editor_entrance;
		instance_destroy(obj_cyop_loader);
	}
	else
		cyop_load_level_internal(global.cyop_hub_level, true);
}

with (obj_player1)
{
	swap_player();
	global.pistol = false;
	global.noisejetpack = false;
	global.snickchallenge = false;
	
	noisepizzapepper = false;
	targetDoor = "HUB";
	targetRoom = _r;
	scr_room_goto(_r);
	x = backtohubstartx;
	y = backtohubstarty;
	state = states.comingoutdoor;
	sprite_index = spr_walkfront;
	image_index = 0;
	image_blend = c_white;
}
