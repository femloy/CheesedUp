scr_menu_getinput();
if !ready
{
	if (!global.swapmode || obj_inputAssigner.player_input_device[obj_inputAssigner.player_index] > -2)
	{
		var move = key_left2 + key_right2;
		if move != 0
		{
			sound_play_3d("event:/sfx/pep/step", room_width / 2, room_height / 2);
			selected = !selected;
		}
	}
	if ((key_jump/* || key_start*/) && (!global.swapmode || obj_inputAssigner.swap_ready))
	{
		ready = true;
		alarm[0] = 100;
		stop_music();
		
		if !global.swapmode
		{
			if selected == 0
			{
				sound_play("event:/sfx/ui/pepselect");
				with obj_peppinoselect
				{
					sprite_index = spr_peppinoselected;
					image_index = 0;
				}
				with obj_player1
				{
					character = "P";
					scr_characterspr();
				}
			}
			else
			{
				sound_play("event:/sfx/ui/noiseselect");
				with obj_noiseselect
				{
					sprite_index = spr_noiseselected;
					image_index = 0;
				}
				with obj_player1
				{
					character = "N";
					scr_characterspr();
				}
			}
		}
		else
		{
			sound_play("event:/sfx/ui/pepselect");
			sound_play("event:/sfx/ui/noiseselect");
			with obj_peppinoselect
			{
				sprite_index = spr_peppinoselected;
				image_index = 0;
			}
			with obj_noiseselect
			{
				sprite_index = spr_noiseselected;
				image_index = 0;
			}
			with obj_player1
			{
				character = other.selected == 0 ? "P" : "N";
				scr_characterspr();
			}
		}
	}
}
