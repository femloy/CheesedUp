ensure_order;

if pause && !instance_exists(obj_loadingscreen) && alarm[3] == -1
{
	with obj_music
	{
		fmod_event_instance_set_paused(pillarmusicID, true);
		fmod_event_instance_set_paused(panicmusicID, true);
		fmod_event_instance_set_paused(kidspartychaseID, true);
	}
}

if instance_exists(obj_popupscreen)
	exit;
if pause_buffer > 0
	pause_buffer--;

if !pause && instance_exists(obj_player1) && alarm[3] == -1 && (obj_player1.key_start or (!window_has_focus() && global.unfocus_pause))
&& room != Mainmenu && room != Finalintro && room != hub_loadingscreen && room != Endingroom && room != Creditsroom && room != Johnresurrectionroom && room != Longintro && room != rank_room && room != Realtitlescreen && room != timesuproom
{
	with obj_player1
	{
		other.spr_palette = spr_palette;
		other.paletteselect = paletteselect;
		other.character = character;
	}
	
	var _cutscenehandler = false;
	with obj_cutscene_handler
	{
		if !loop
			_cutscenehandler = true;
	}
	with obj_player1
	{
		if ((instance_exists(obj_bosskey) && state == states.victory) || (state == states.victory && place_meeting(x, y, obj_startgate)) || (state == states.door && place_meeting(x, y, obj_exitgate)))
			_cutscenehandler = true;
	}
	with obj_charswitch_intro
		_cutscenehandler = true;
	with obj_bossplayerdeath
        _cutscenehandler = true;
	with obj_titlecard
		_cutscenehandler = true;
	with obj_taxi
	{
		if move
			_cutscenehandler = true;
	}
	with obj_taxidud
	{
		if !start
			_cutscenehandler = true;
	}
	with obj_pizzafaceboss_p3intro
        _cutscenehandler = true;
    with obj_pizzahead_finalecutscene
        _cutscenehandler = true;
	if global.in_menu
		_cutscenehandler = true;
	with obj_modconfig
		_cutscenehandler = true;
	with obj_jumpscare
		_cutscenehandler = true;
	with obj_technicaldifficulty
		_cutscenehandler = true;
	with obj_editormenu
	{
		if menu != 0 or state != 0
			_cutscenehandler = true;
	}
	with obj_elevatorcutscene
		_cutscenehandler = true;
	if pause_buffer > 0
		_cutscenehandler = true;
	with obj_levelselect
		buffer = 30;
	with obj_savesystem
	{
		if state != 0
			_cutscenehandler = true;
	}
	
	// pause
	if !_cutscenehandler
	{
		destroy_sounds([pausemusicID]);
		if SUGARY_SPIRE && check_sugary()
			pausemusicID = fmod_event_create_instance("event:/modded/sugary/pause");
		else if is_holiday(holiday.halloween)
			pausemusicID = fmod_event_create_instance("event:/music/halloweenpause");
		else
			pausemusicID = fmod_event_create_instance("event:/music/pause");
		
		selected = 0;
		fadein = true;
		pause = true;
		fade = 0;
		
		pause_menu = ["pause_resume"];
		if global.jukebox != noone
			array_push(pause_menu, "pause_jukebox");
		array_push(pause_menu, "pause_options");
		if global.leveltorestart != -4
		{
			var checkpoint = global.timeattack or is_struct(global.checkpoint_data);
			array_push(pause_menu, checkpoint ? "pause_checkpoint" : "pause_restart");
			
			if array_contains(base_game_levels(false, true), global.leveltosave)
			{
				var show = global.taskpausestyle == TASK_PAUSE_STYLES.show;
				if global.taskpausestyle == TASK_PAUSE_STYLES.hide_on_completion
				{
					var ach = get_level_achievements(global.leveltosave);
					for(var i = 0; i < array_length(ach.achievements); i++)
					{
						if !ach.achievements[i].got
						{
							show = true;
							break;
						}
					}
				}
				if show
					array_push(pause_menu, "pause_achievements");
			}
			
			array_push(pause_menu, "pause_exit");
		}
		else
			array_push(pause_menu, room == editor_entrance ? "pause_exit_menu" : "pause_exit_title");
		
		with obj_music
		{
			if global.jukebox != noone
				waiting = true;
			if music != noone
			{
				other.savedmusicpause = fmod_event_instance_get_paused(music.event);
				other.savedsecretpause = fmod_event_instance_get_paused(music.event_secret);
				fmod_event_instance_set_paused(music.event, true);
				fmod_event_instance_set_paused(music.event_secret, true);
			}
			other.savedpillarpause = fmod_event_instance_get_paused(pillarmusicID);
			other.savedkidspartypause = fmod_event_instance_get_paused(kidspartychaseID);
			other.savedpanicpause = fmod_event_instance_get_paused(panicmusicID);
			fmod_event_instance_set_paused(pillarmusicID, true);
			fmod_event_instance_set_paused(panicmusicID, true);
			fmod_event_instance_set_paused(kidspartychaseID, true);
		}
		
		if global.leveltosave != noone
		{
			treasurefound = false;
			secretcount = 0;
			
			if gamesave_open_ini()
			{
				treasurefound = ini_read_real("Treasure", global.leveltosave, false);
				secretcount = ini_read_real("Secret", global.leveltosave, 0);
				gamesave_close_ini(false);
			}
			
			if !treasurefound
			{
				treasurefound = global.treasure;
				treasurealpha = 0;
			}
			else if !global.treasure
				treasurealpha = 0.5;
			else
				treasurealpha = 0;
			
			if global.secretfound > secretcount
			{
				secretcount = global.secretfound;
				secretalpha = 0;
			}
			else if global.secretfound < secretcount
				secretalpha = 0.5;
			else
				secretalpha = 0;
			
			if secretcount > 3
				secretcount = 3;
		}
		else
		{
			treasurefound = false;
			secretcount = 0;
		}
		scr_delete_pause_image();
		scr_create_pause_image(true);
		cursor_x = -60;
		cursor_y = -300;
		cursor_index = 0;
		backbuffer = 2;
		var _state = noone;
		var _txt = noone;
		with (obj_player1)
		{
			_state = state;
			if (state == states.chainsaw)
				_state = tauntstoredstate;
			switch (_state)
			{
				case states.knightpep:
				case states.knightpepslopes:
				case states.knightpepbump:
					_txt = lang_get_value("knighttip");
					break;
				case states.firemouth:
					_txt = lang_get_value("firemouthtip");
					break;
				case states.boxxedpep:
				case states.boxxedpepjump:
				case states.boxxedpepspin:
					_txt = lang_get_value("boxxedtip");
					if (character == "N")
						_txt = lang_get_value("boxxedtipN");
					break;
				case states.mort:
				case states.mortattack:
				case states.morthook:
				case states.mortjump:
					_txt = lang_get_value("morttip");
					break;
				case states.ghost:
					_txt = lang_get_value("ghosttip");
					if (character == "N")
						_txt = lang_get_value("ghosttipN");
					break;
				case states.rocket:
				case states.rocketslide:
					_txt = lang_get_value("rockettip");
					if (character == "N")
						_txt = lang_get_value("rockettipN");
					break;
				case states.barrel:
				case states.barrelclimbwall:
				case states.barreljump:
				case states.barrelslide:
					_txt = lang_get_value("barreltip");
					break;
				case states.trashroll:
					if (sprite_index == spr_player_corpsesurf || sprite_index == spr_player_corpsestart)
						_txt = lang_get_value("gravesurftip");
					else
					{
						_txt = lang_get_value("trashrolltip");
						if (character == "N")
							_txt = lang_get_value("trashrolltipN");
					}
					break;
				case states.antigrav:
					_txt = lang_get_value("antigravtip");
					if (character == "N")
						_txt = lang_get_value("antigravtipN");
					break;
				case states.cheesepep:
				case states.cheesepepstickside:
				case states.cheesepepstick:
				case states.cheesepepjump:
				case states.cheesepepstickup:
					_txt = lang_get_value("cheesedtip");
					break;
				case states.golf:
					_txt = lang_get_value("golftip");
					break;
				case states.rideweenie:
					_txt = lang_get_value("weenietip");
					break;
				case states.bombpep:
					if (character == "N")
						_txt = lang_get_value("bombtipN");
					break;
				
				case states.swimming:
					_txt = lang_get_value("fireasstipV");
					break;
			}
			if (_txt == noone)
			{
				if (shotgunAnim)
				{
					_txt = lang_get_value("shotguntip");
					if global.shootbutton != 0 && character != "V"
						_txt = string_replace(_txt, "[G]", "[S]");
				}
				else if (global.noisejetpack)
					_txt = lang_get_value("jetpack2tip");
			}
		}
		if (_txt != noone)
		{
			draw_set_font(lang_get_font("creditsfont"));
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			transfotext = scr_compile_icon_text(_txt);
			transfotext_size = scr_text_arr_size(transfotext);
		}
		else
			transfotext = noone;
		scr_pause_deactivate_objects();
		
		if global.jukebox == noone
		{
			fmod_event_instance_play(pausemusicID);
			fmod_event_instance_set_paused(pausemusicID, false);
		}
	}
}
with (obj_player1)
{
	other.paletteselect = paletteselect;
	other.spr_palette = spr_palette;
}
border1_xstart = 0;
border1_ystart = SCREEN_HEIGHT;
border1_xend = -96;
border1_yend = SCREEN_HEIGHT + 100;
border2_xstart = SCREEN_WIDTH;
border2_ystart = SCREEN_HEIGHT;
border2_xend = SCREEN_WIDTH + 96;
border2_yend = SCREEN_HEIGHT + 100;
if (is_holiday(holiday.halloween))
{
	border1_xend = -128;
	border1_yend = SCREEN_HEIGHT + 150;
	border2_xend = SCREEN_WIDTH + 128;
	border2_yend = SCREEN_HEIGHT + 150;
}
vine_ystart = 0;
vine_yend = -117;
if (!start)
{
	start = true;
	border2_x = border2_xend;
	border2_y = border2_yend;
	border1_x = border1_xend;
	border1_y = border1_yend;
	vine_y = vine_yend;
}

var a = 0.1;
if (!instance_exists(obj_loadingscreen))
{
	if (fadein)
	{
		fade = Approach(fade, 1, a);
		border1_x = lerp(border1_x, border1_xstart, a);
		border1_y = lerp(border1_y, border1_ystart, a);
		border2_x = lerp(border2_x, border2_xstart, a);
		border2_y = lerp(border2_y, border2_ystart, a);
		vine_y = lerp(vine_y, vine_ystart, a);
		cursor_x = lerp(cursor_x, 0, a / 2);
		cursor_y = lerp(cursor_y, 0, a);
	}
	else
	{
		fade = Approach(fade, 0, a);
		border1_x = lerp(border1_x, border1_xend, a);
		border1_y = lerp(border1_y, border1_yend, a);
		border2_x = lerp(border2_x, border2_xend, a);
		border2_y = lerp(border2_y, border2_yend, a);
		vine_y = lerp(vine_y, vine_yend, a);
		cursor_x = lerp(cursor_x, 20, a / 2);
		cursor_y = lerp(cursor_y, -100, a);
	}
}

cursor_index += 0.35;
pause_update_priests();

if pause && !instance_exists(obj_option) && !instance_exists(obj_achievement_pause) && alarm[3] == -1
&& !instance_exists(par_choicebase)
{
	scr_menu_getinput();
	key_back = key_back || key_start;
	if (backbuffer > 0)
	{
		backbuffer--;
		key_back = false;
	}
	moveselect = -key_up2 + key_down2;
	var prevselect = selected;
	selected += moveselect;
	if (selected >= array_length(pause_menu))
		selected = 0;
	else if (selected < 0)
		selected = array_length(pause_menu) - 1;
	if (prevselect != selected)
	{
		var movesnd = "event:/sfx/ui/angelmove";
		if SUGARY_SPIRE && check_sugary()
			movesnd = sfx_step;
		sound_play(movesnd);
		update_cursor = true;
	}
	if (key_back)
	{
		selected = 0;
		key_jump = true;
	}
	if (key_jump)
		pause_menu_map[? pause_menu[selected]][1]();
}
if keyboard_check_pressed(vk_f12) && sprite_exists(screensprite) && pause
{
	sprite_save(screensprite, 0, $"screenshots/{DATE_TIME_NOW}.png");
	if !window_get_fullscreen()
		launch_external($"explorer.exe \"{save_folder}screenshots\\\"");
	
	with create_transformation_tip(lstr("screenshottaken"),,,true)
		depth = other.depth - 1;
}
if (pause)
	scr_pauseicons_update(array_get(ds_map_find_value(pause_menu_map, array_get(pause_menu, selected)), 0));
else
	scr_pauseicons_update(-1);