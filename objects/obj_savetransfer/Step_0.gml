live_auto_call;

scr_menu_getinput();

if state == 0
{
	if substate == 0 && obj_mainmenu.sprite_index != spr_titlepep_righttomiddle
	{
		with obj_mainmenu
		{
			if sprite_index != spr_titlepep_left && sprite_index != spr_titlepep_middletoleft
			{
				image_index = 0;
				sprite_index = spr_titlepep_middletoleft;
			}
			if image_index >= image_number - 1
				sprite_index = spr_titlepep_left;
		}
	}
	else
	{
		with obj_mainmenu
		{
			if sprite_index != spr_titlepep_middle && sprite_index != spr_titlepep_lefttomiddle && sprite_index != spr_titlepep_righttomiddle
			{
				image_index = 0;
				sprite_index = sprite_index == spr_titlepep_right ? spr_titlepep_righttomiddle : spr_titlepep_lefttomiddle;
			}
			if image_index >= image_number - 1
				sprite_index = spr_titlepep_middle;
		}
	}
}
else
{
	with obj_mainmenu
	{
		if sprite_index != spr_titlepep_right && sprite_index != spr_titlepep_middletoright
		{
			image_index = 0;
			sprite_index = spr_titlepep_middletoright;
		}
		if sprite_index = spr_titlepep_middletoright && image_index >= image_number - 1
			sprite_index = spr_titlepep_right;
	}
}

switch state
{
	case 0:
		if substate == 0
		{
			if key_slap2 or key_quit2
			{
				sound_play(sfx_back);
				instance_destroy();
			}
		
			if array_length(saves)
			{
				tip_text = lstr("transfer_tip1");
			
				var move = -key_up2 + key_down2;
				if move != 0
				{
					sound_play(sfx_step);
					sel = wrap(sel + move, 0, array_length(saves) - 1);
				}
			
				if key_jump
				{
					sound_play_centered(sfx_enemyprojectile);
					substate = 1;
				}
			}
			else
				tip_text = lstr("transfer_tip2");
			
			grab_text = false;
			hand_spr = spr_grabbiehand_idle;
			hand_x = x1;
			hand_y = Approach(hand_y, 130, 15);
		}
		else if substate == 1
		{
			hand_spr = spr_grabbiehand_fall;
			hand_y = Approach(hand_y, 180, 15);
			if hand_y >= 180
				substate = 2;
			tip_text = "";
		}
		else if substate == 2
		{
			grab_text = true;
			hand_spr = spr_grabbiehand_catch;
			hand_y = Approach(hand_y, -200, 20);
			
			if hand_y <= -200
			{
				state = 1;
				substate = 0;
				
				if sel2 == 0 && saves[sel].type != 0
					sel2 = 1;
			}
		}
		else if substate == 3
		{
			grab_text = false;
			tip_text = "";
			
			hand_spr = spr_grabbiehand_idle;
			hand_y = Approach(hand_y, -50, 20);
			if hand_y <= -50
				substate = 0;
		}
		break;
	
	case 1:
		hand_x = x2;
		hand_y = Approach(hand_y, 140, 15);
		
		if key_slap2 or key_quit2
		{
			sound_play(sfx_back);
			substate = 3;
			state = 0;
		}
		
		if saves[sel].type == 0
		{
			tip_text = lstr("transfer_tip3");
			sel2 = 0;
		}
		else
		{
			tip_text = lstr("transfer_tip4");
			var move = -key_up2 + key_down2;
			if move != 0
			{
				sound_play(sfx_step);
				sel2 = wrap(sel2 + move, 1, array_length(saves_current) - 1);
			}
		}
		if key_jump
		{
			state = 2;
			sel3 = 1;
		}
		break;
	
	case 2:
		var move = key_right + key_left;
		if move == 1
			sel3 = 1;
		if move == -1
			sel3 = 0;
		
		if (key_jump && sel3 == 1) or key_slap2 or key_quit2
		{
			state = 0;
			substate = 3;
		}
		
		if key_jump && sel3 == 0
			state = 3;
		break;
	
	case 3:
		// SETTINGS
		if sel2 == 0
		{
			var pt_file = saves[sel];
			var cu_file = saves_current[sel2];
			
			file_delete(cu_file.path);
			file_copy(pt_file.path, cu_file.path);
			
			with obj_savesystem
			{
				ini_open(game_save_id + "saveData.ini");
				toggle_gameframe(ini_read_real("Modded", "gameframe", true));
				ini_write_real("Modded", "disclaimer", true);
				ini_str_options = ini_close();
			}
			with obj_screensizer
			{
				get_options();
				screen_apply_vsync();
				set_audio_config(false);
			}
			load_mod_config();
			
			sound_play("event:/modded/sfx/downloaded");
		}
		
		// SAVE FILE
		else
		{
			var pt_file = saves[sel];
			var cu_file = saves_current[sel2];
			
			file_delete(cu_file.path);
			file_copy(pt_file.path, cu_file.path);
			
			with obj_savesystem
			{
				ini_open(cu_file.path);
				ini_write_string("Game", "character", pt_file.character);
				ini_close();
			}
			
			if cu_file.sandbox
			{
				global.game[cu_file.slot] = scr_read_game(cu_file.path);
				global.game[cu_file.slot].character = pt_file.character;
				
				with obj_mainmenu
				{
					charselect = 0;
					currentselect = cu_file.slot;
				}
			}
			else
			{
				global.story_game[cu_file.slot] = scr_read_game(cu_file.path);
				global.story_game[cu_file.slot].character = pt_file.character;
				
				with obj_mainmenu
				{
					charselect = 1;
					currentselect = cu_file.slot;
				}
			}
			
			sound_play("event:/modded/sfx/downloaded");
			sound_play("event:/sfx/ui/switchchardown");
		}
		instance_destroy();
		break;
}

if keyboard_check_pressed(ord("R"))
{
	state = 0;
	substate = 0;
	sel = 0;
}

if tip_text != tip_text_prev
{
	tip_text_prev = tip_text;
	draw_set_font(lfnt("creditsfont"));
	tip = scr_compile_icon_text(tip_text, 1, true);
}

image_alpha = Approach(image_alpha, 1, 0.1);
