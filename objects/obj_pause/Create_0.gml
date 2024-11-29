pause = false;
i = false;
color = make_color_rgb(121, 103, 151);
scr_init_input();
player1 = -4;
player2 = -4;
selected = 0;
stickpressed = false;
image_speed = 0;
depth = -500;
backbuffer = 2;
savedmusicmuffle = 0;

pause_menu = ["pause_resume", "pause_options", "pause_restart", "pause_exit"];
pause_menu_map = ds_map_create();
ds_map_set(pause_menu_map, "pause_resume", [0, function()
{
	scr_pause_activate_objects(true, true);
	pause_unpause_music();
	instance_destroy(obj_option);
	instance_destroy(obj_keyconfig);
}]);
ds_map_set(pause_menu_map, "pause_achievements", [4, function()
{
	sound_play("event:/sfx/ui/select");
	with (instance_create(x, y, obj_achievement_pause))
		depth = other.depth - 1;
}]);
ds_map_set(pause_menu_map, "pause_options", [1, function()
{
	sound_play("event:/sfx/ui/select");
	with (instance_create(x, y, obj_option))
		depth = other.depth - 1;
}]);
ds_map_set(pause_menu_map, "pause_restart", [2, function()
{
	if room == Endingroom || room == tower_soundtest || room == tower_soundtestlevel || room == Creditsroom || room == Johnresurrectionroom
		exit;
	
	var rm = global.leveltorestart;
	if rm != -4 && rm != -1
	{
		global.timeattack = false;
		global.input_buffer = 1;
		
		pause_unpause_music();
		stop_music();
		scr_pause_activate_objects(true, true);
		scr_pause_stop_sounds();
		
		roomtorestart = rm;
		event_perform(ev_alarm, 5);
	}
	else
		sound_play("event:/sfx/ui/select");
}]);
var exit_function = function()
{
	if (room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
		exit;
	
	reset_modifier();
	pause_unpause_music();
	stop_music();
	scr_pause_stop_sounds();
	
	fmod_event_instance_stop(global.snd_bossbeaten, true);
	fmod_event_instance_stop(pausemusicID, true);
	with obj_music
		music = noone;
	
	var offload = noone;
	if global.leveltorestart != -4 or room == editor_entrance
	{
		if global.leveltorestart != boss_fakepepkey && global.leveltorestart != tower_tutorial1N
			gamesave_async_save();
		
		hub = true;
		offload = ["hubgroup"];
		global.stargate = false;
		global.leveltorestart = -4;
	}
	else
	{
		hub = false;
		offload = ["menugroup"];
		
		with obj_player1
		{
			character = "P";
			scr_characterspr();
		}
	}
	
	with textures_offload(offload)
	{
		ds_list_clear(instance_list);
		ds_list_copy(instance_list, other.instance_list);
		
		instance_deactivate_object(other.id);
		ds_list_add(instance_list, other.id);
		
		pause = true;
		pauseID = other.id;
	}
};
ds_map_set(pause_menu_map, "pause_exit", [3, exit_function]);
ds_map_set(pause_menu_map, "pause_exit_title", [3, exit_function]);
ds_map_set(pause_menu_map, "pause_exit_menu", [3, exit_function]);

ds_map_set(pause_menu_map, "pause_jukebox", [5, function()
{
	array_delete(pause_menu, selected, 1);
	selected = 0;
	
	fmod_event_instance_stop(global.jukebox.instance, true);
	fmod_event_instance_release(global.jukebox.instance);
	global.jukebox = noone;
	
	fmod_event_instance_play(pausemusicID);
	fmod_event_instance_set_paused(pausemusicID, false);
}]);

ds_map_set(pause_menu_map, "pause_checkpoint", [6, function()
{
	global.input_buffer = 1;
	
	pause_unpause_music();
	stop_music();
	scr_pause_activate_objects(true, true);
	scr_pause_stop_sounds();
	
	if global.timeattack
	{
		roomtorestart = global.leveltorestart;
		event_perform(ev_alarm, 5);
	}
	else
	{
		scr_delete_pause_image();
		instance_destroy(obj_fadeout);
		load_checkpoint();
	}
}]);

cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_angelpriest);
cursor_sprite_height = sprite_get_height(spr_angelpriest);
cursor_x = -1000;
cursor_y = -1000;
cursor_actualx = 0;
cursor_actualy = 0;
update_cursor = false;
hub = true;
treasurefound = false;
treasurealpha = 0;
secretcount = 0;
secretalpha = 0;
transfotext = -4;
transfotext_size = 0;
roomtorestart = -4;
pausemusicID = fmod_event_create_instance("event:/music/pause");
savedsecretpause = false;
savedmusicpause = false;
savedpillarpause = false;
savedpanicpause = false;
savedkidspartypause = false;
fade = 0;
fadein = false;
screensprite = noone;
screensprite2 = noone;
screensize = 0;
guisprite = -4;
instance_list = ds_list_create();
priest_list = ds_list_create();
start = false;
pause_icons = array_create(0);
scr_pauseicon_add(spr_pauseicons, 0, -20, -12); // resume 0
scr_pauseicon_add(spr_pauseicons, 1, 5, -15); // option 1
scr_pauseicon_add(spr_pauseicons, 2, -10); // restart 2
scr_pauseicon_add(spr_pauseicons, 3, -10); // exit 3
scr_pauseicon_add(spr_pauseicons, 8, 0, -12); // chef task 4
scr_pauseicon_add(spr_pauseicons, 11, -24, -12); // stop music 5
scr_pauseicon_add(spr_pauseicons, 10, -16, -12); // restart from checkpoint 6
alarm[1] = 1;

spr_palette = spr_peppalette;
paletteselect = 1;
character = "P";
pause_buffer = 0;
