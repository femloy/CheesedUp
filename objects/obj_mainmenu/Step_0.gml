live_auto_call;

scr_menu_getinput();
index += 0.1;
switch state
{
	#region DARKENED INTRO
	
	case states.titlescreen:
		currentselect = -1;
		if (!instance_exists(obj_noiseunlocked))
		{
			jumpscarecount++;
			if ((keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != -4 || scr_checkanystick(obj_inputAssigner.player_input_device[0])) && (!instance_exists(obj_mainmenu_jumpscare)))
			{
				state = states.transition;
				currentselect = -1;
				visualselect = -1;
				darkcount = 7;
				dark = false;
				darkbuffer = 5;
				jumpscarecount = 0;
				sound_play("event:/sfx/ui/lightswitch");
				with obj_music
				{
					if music != noone
						fmod_event_instance_set_parameter(music.event, "state", 1, true);
				}
			}
			if (jumpscarecount > 2400 && !instance_exists(obj_mainmenu_jumpscare))
			{
				instance_create(480, 270, obj_mainmenu_jumpscare);
				sound_play("event:/sfx/enemies/jumpscare");
			}
		}
		break;
	
	#endregion
	#region LIGHT FLICKER
	
	case states.transition:
		if darkbuffer > 0
			darkbuffer--;
		else
		{
			dark = !dark;
			if darkcount > 0
			{
				darkcount--;
				if dark
					darkbuffer = 2 + irandom(3);
				else
					darkbuffer = 6 + irandom(5);
				if darkcount <= 0
				{
					dark = false;
					darkbuffer = 40;
				}
			}
			else
			{
				alarm[2] = showbuffer_max;
				currentselect = 0;
				visualselect = 0;
				dark = false;
				state = states.normal;
				sprite_index = spr_titlepep_forwardtoleft;
				image_index = 0;
			}
		}
		break;
	
	#endregion
	#region NORMAL
	
	case states.normal:
		if instance_exists(obj_savetransfer)
			break;
		
		if key_start && optionbuffer <= 0 && !instance_exists(obj_option) && !instance_exists(obj_noiseunlocked)
		{
			with instance_create(0, 0, obj_option)
				backbuffer = 2;
			break;
		}
		else if instance_exists(obj_option)
		{
			quitbuffer = 3;
			break;
		}
		else if charselect == 2
		{
			var _move_v = key_down2 - key_up2;
			if _move_v != 0
			{
				if _move_v == -1 && extramenusel == 0
				{
					game_icon_y = -5;
					game_icon_buffer = 8;
					game_icon_index = 0;
					sound_play("event:/sfx/ui/switchchardown");
					charselect--;
				}
				else
				{
					var c = extramenusel;
					extramenusel = clamp(extramenusel + _move_v, 0, 2);
					
					if c != extramenusel
						sound_play(sfx_step);
				}
			}
			else if key_jump
			{
				switch extramenusel
				{
					case 0:
						sound_play(sfx_select);
						instance_create(0, 0, obj_savetransfer);
						exit;
					case 1:
						sound_play_centered(sfx_collecttoppin);
						url_open("https://www.youtube.com/@CheesyPT");
						break;
					case 2:
						sound_play_centered(sfx_collecttoppin);
						url_open("https://discord.gg/thenoise");
						break;
				}
			}
			
			if floor(image_index) == image_number - 1
			{
				switch sprite_index
				{
					case spr_titlepep_forwardtoleft:
					case spr_titlepep_middletoleft:
						sprite_index = spr_titlepep_left;
						break;
					case spr_titlepep_lefttomiddle:
					case spr_titlepep_righttomiddle:
						sprite_index = spr_titlepep_middle;
						break;
					case spr_titlepep_middletoright:
						sprite_index = spr_titlepep_right;
						break;
				}
			}
		}
		else
		{
			move = key_left2 + key_right2;
			
			// swap to and from sandbox mode
			var p = 5;
			
			var _move_v = key_down2 - key_up2;
			if _move_v != 0
			{
				instance_activate_object(obj_menutv);
				
				var c = charselect;
				charselect += _move_v;
				charselect = clamp(charselect, 0, 2);
				
				if charselect != c
				{
					game_icon_y = p * _move_v;
					game_icon_buffer = 8;
					game_icon_index = 0;
						
					if _move_v > 0
						sound_play("event:/sfx/ui/switchcharup");
					else
						sound_play("event:/sfx/ui/switchchardown");
						
					with obj_menutv
					{
						if selected
						{
							state = states.transition;
							sprite_index = transspr;
							image_index = 0;
						}
					}
				}
				/*
				else if _move_v == 1
				{
					fmod_event_instance_set_parameter(global.snd_golfjingle, "state", 0, 0);
					fmod_event_instance_play(global.snd_golfjingle);
					game_icon_y = p * _move_v;
					game_icon_buffer = 8;
					game_icon_index = 0;
				}
				*/
			}
			
			// able to move
			if ((sprite_index != spr_titlepep_punch && sprite_index != spr_titlepep_angry) || move != 0)
			{
				if move != 0
					angrybuffer = 0;
				currentselect += move;
				currentselect = clamp(currentselect, 0, 2);
				if (currentselect != visualselect && (sprite_index == spr_titlepep_left || sprite_index == spr_titlepep_middle || sprite_index == spr_titlepep_right))
				{
					visualselect = Approach(visualselect, currentselect, 1);
					alarm[2] = showbuffer_max;
					image_index = 0;
					if visualselect == 0 && sprite_index == spr_titlepep_middle
						sprite_index = spr_titlepep_middletoleft;
					if visualselect == 1 && sprite_index == spr_titlepep_left
						sprite_index = spr_titlepep_lefttomiddle;
					if visualselect == 2 && sprite_index == spr_titlepep_middle
						sprite_index = spr_titlepep_middletoright;
					if visualselect == 1 && sprite_index == spr_titlepep_right
						sprite_index = spr_titlepep_righttomiddle;
				}
				if (floor(image_index) == image_number - 1)
				{
					switch sprite_index
					{
						case spr_titlepep_forwardtoleft:
						case spr_titlepep_middletoleft:
							sprite_index = spr_titlepep_left;
							break;
						case spr_titlepep_lefttomiddle:
						case spr_titlepep_righttomiddle:
							sprite_index = spr_titlepep_middle;
							break;
						case spr_titlepep_middletoright:
							sprite_index = spr_titlepep_right;
							break;
					}
				}
			}
			
			// after punch
			else if sprite_index == spr_titlepep_angry
			{
				y = ystart;
				if angrybuffer > 0
					angrybuffer--;
				else
				{
					sprite_index = savedsprite;
					switch sprite_index
					{
						case spr_titlepep_forwardtoleft:
						case spr_titlepep_middletoleft:
							sprite_index = spr_titlepep_left;
							break;
						case spr_titlepep_lefttomiddle:
						case spr_titlepep_righttomiddle:
							sprite_index = spr_titlepep_middle;
							break;
						case spr_titlepep_middletoright:
							sprite_index = spr_titlepep_right;
							break;
					}

					image_index = savedindex;
					image_speed = 0.35;
				}
			}
			else
			{
				if vsp < 20
					vsp += 0.5;
				y += vsp;
				if y >= ystart && vsp > 0
				{
					y = ystart;
					vsp = 0;
				}
			}
			
			// get current game
			game = menu_get_game(currentselect, charselect == 0);
			
			// select the savefile
			if is_struct(game)
			{
				if key_jump && _move_v == 0
				{
					with obj_menutv
					{
						if trigger == other.currentselect
						{
							with other
							{
								var allowed_characters = ["P", "N"];
								if charselect != 0 && game.started && !array_contains(allowed_characters, game.character, 0, infinity)
								{
									with obj_menutv
									{
										if trigger == other.currentselect
											instance_deactivate_object(id);
									}
									with instance_create(0, 0, obj_mariohell)
										character = other.game.character;
									exit;
								}
								
                                // netclient title screen
								var f = method(self, function()
								{
									state = states.victory;
									alarm[0] = 250;
								
									if game.character == "N"
									{
										alarm[3] = 100;
										alarm[4] = 5;
										timermax = 15;
										explosionsnum = 1;
										sound_play("event:/sfx/ui/menuexplosions");
									}
									if game.character == "V"
										alarm[3] = 1.85 * 60;
								});
								
                                if !CHEESED_UP && !instance_exists(obj_netclient)
								{
                                    with instance_create(0, 0, obj_netclient)
										verify_callback = f;
								}
								else
									f();
							}
							
							with obj_music
							{
								if music != noone
									fmod_event_instance_stop(music.event, true);
							}
							switch other.game.character
							{
								default:
									sound_play("event:/sfx/ui/fileselect");
									break;
								case "N":
									sound_play("event:/sfx/ui/fileselectN");
									break;
								case "V":
									sound_play("event:/modded/fileselectV");
									break;
							}
							state = states.victory;
							sprite_index = confirmspr;
						}
					}
					sound_play("event:/sfx/misc/collectpizza");
					switch currentselect
					{
						case 0:
							sprite_index = spr_titlepep_left;
							break;
						case 1:
							sprite_index = spr_titlepep_middle;
							break;
						case 2:
							sprite_index = spr_titlepep_right;
							break;
					}
				}
			
				// exit game
				else if key_quit2
				{
					if quitbuffer <= 0
					{
						state = states.ending;
						exitselect = 1;
						switch currentselect
						{
							case 0:
								sprite_index = spr_titlepep_left;
								break;
							case 1:
								sprite_index = spr_titlepep_middle;
								break;
							case 2:
								sprite_index = spr_titlepep_right;
								break;
						}
					}
				}
			
				// delete current savefile
				else if key_delete2 && game.started
				{
					deletebuffer = 0;
					state = states.bombdelete;
					deleteselect = 1;
					sound_play_3d("event:/sfx/voice/pig", 480, 270);
					switch currentselect
					{
						case 0:
							sprite_index = spr_titlepep_left;
							break;
						case 1:
							sprite_index = spr_titlepep_middle;
							break;
						case 2:
							sprite_index = spr_titlepep_right;
							break;
					}
				}
			}
			break;
		}
	
	#endregion
	#region DELETE FILE
	
	case states.bombdelete:
		deleteselect += key_left2 + key_right2;
		deleteselect = clamp(deleteselect, 0, 1);
		if key_jump2
			deletebuffer++;
		else
			deletebuffer = 0;
		if ((deleteselect == 1 && key_jump) || (deleteselect == 0 && deletebuffer >= 120))
		{
			if deleteselect == 0
			{
				var file = "";
				switch charselect
				{
					case 0:
						file = concat(get_save_folder(), "/saveData", currentselect + 1, ".ini")
						global.game[currentselect] = game_empty();
						break;
					case 1:
						file = concat(get_save_folder(), "/saveData", currentselect + 1, "S.ini")
						global.story_game[currentselect] = game_empty();
						break;
				}
				if file != "" && file_exists(file)
					file_delete(file);
				
				sound_play_3d("event:/sfx/misc/explosion", 480, 270);
				sound_play_3d("event:/sfx/mort/mortdead", 480, 270);
				
				with obj_menutv
				{
					if trigger == other.currentselect && sprite_index == selectedspr
						sprite_index = transspr;
				}
				with obj_camera
				{
					shake_mag = 4;
					shake_mag_acc = 5 / room_speed;
				}
			}
			state = states.normal;
		}
		break;
	
	#endregion
	#region END GAME
	
	case states.ending:
		exitselect += key_left2 + key_right2;
		exitselect = clamp(exitselect, 0, 1);
		if key_jump
		{
			if exitselect == 0
				game_end();
			else
				state = states.normal;
		}
		break;
	
	#endregion
}

if vsp < 20
	vsp += 0.5;
y += vsp;
if y >= ystart && vsp > 0
{
	y = ystart;
	vsp = 0;
}

if quitbuffer > 0
	quitbuffer--;
if state == states.bombdelete && deletebuffer > 0
{
	if (!fmod_event_instance_is_playing(bombsnd))
		fmod_event_instance_play(bombsnd);
}
else
	fmod_event_instance_stop(bombsnd, false);

if optionbuffer > 0
	optionbuffer--;
if state != states.titlescreen && state != states.transition
	extrauialpha = Approach(extrauialpha, 1, 0.1);

game_icon_index += 0.1;
if game_icon_y != 0
	game_icon_index = 0;
if game_icon_buffer > 0
	game_icon_buffer--;
else
	game_icon_y = 0;

if is_struct(game)
{
	var a = floor(abs(pep_percvisual - game.percentage) / 10) + 1;
	pep_percvisual = Approach(pep_percvisual, game.percentage, a);
	game.percvisual = pep_percvisual;
	
	if charselect == 0
	{
		pep_percvisual = 0;
		game.percvisual = 0;
	}
}

extramenualpha = Approach(extramenualpha, charselect == 2 ? 0 : 1, .15);
with obj_menutv
{
	image_alpha = other.extramenualpha;
	if trigger == other.currentselect && other.charselect != 2
		selected = true;
	else
		selected = false;
}
if gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_shoulderrb)
{
	punch_x = x + irandom_range(-40, 40);
	punch_y = y + irandom_range(-30, 30);
	event_user(0);
}
