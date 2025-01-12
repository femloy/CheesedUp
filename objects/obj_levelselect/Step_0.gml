live_auto_call;

with obj_backtohub_fadeout
{
	instance_create(0, 0, obj_genericfade);
	instance_destroy();
}

if buffer != 0
{
	buffer--;
	exit;
}

if instance_exists(obj_levelsettings)
	exit;

with obj_player
{
	state = states.titlescreen;
	movespeed = 0;
	hsp = 0;
	vsp = 0;
}

scr_menu_getinput();

if key_taunt2
{
	instance_create(0, 0, obj_levelsettings);
	exit;
}

var _m = key_down2 - key_up2;
if _m != 0
{
	sound_play(sfx_step);
	selected_level = 0;
	selected_world += _m;
	selected_world = clamp(selected_world, 0, array_length(worlds) - 1);
}

var levels = worlds[selected_world].levels;

var _n = key_left2 + key_right2;
if _n != 0
{
	sound_play(sfx_step);
	selected_level += _n;
	selected_level = clamp(selected_level, 0, array_length(levels) - 1);
}

if key_jump2 && selected_level >= 0 && selected_level < array_length(levels)
{
	buffer = -1;
	levels[selected_level].func();
}
