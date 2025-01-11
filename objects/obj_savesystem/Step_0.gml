if room == hub_loadingscreen && state != 2
{
	with obj_player
	{
		state = states.comingoutdoor;
		sprite_index = spr_walkfront;
		image_index = 0;
	}
	if !fadeoutcreate
	{
		fadeoutcreate = true;
		
		var grouparr = ["hubgroup"];
		with obj_player1
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _intro = ini_read_real("Tutorial", "finished", false);
			
			player_paletteselect[0] = ini_read_real("Game", "palette", 1);
			player_paletteselect[1] = ini_read_real("Game", "palette_player2", 1);
			paletteselect = player_paletteselect[0];
			
			var _texture = ini_read_string("Game", "palettetexture", "none");
			var _texture2 = ini_read_string("Game", "palettetexture_player2", "none");
			player_patterntexture[0] = scr_get_texture_palette(_texture);
			player_patterntexture[1] = scr_get_texture_palette(_texture2);
			global.palettetexture = player_patterntexture[0];
			
			if (_intro or global.sandbox)
			{
				targetRoom = tower_entrancehall;
				targetDoor = "A";
				state = states.victory;
				
				character = ini_read_string("Game", "character", "P");
				if !array_contains(scr_charlist(), character)
				{
					character = "P";
					player_paletteselect[0] = 1;
				}
				
				//if global.swapmode
				//	character = global.swap_characters[global.swap_index];
				
				noisetype = noisetype.base;
				scr_characterspr();
				
				if character == "G"
				{
					ratmount_movespeed = 8;
					gustavodash = 0;
					isgustavo = true;
					state = states.ratmount;
					sprite_index = spr_ratmount_idle;
					brick = true;
				}
				else
					isgustavo = false;
				
				hat = ini_read_real("Game", "hat", -1);
				pet = ini_read_real("Game", "pet", -1);
				
				ini_close();
			}
			else
			{
				targetDoor = "A";
				state = states.titlescreen;
				
				if !global.sandbox && character == ""
					targetRoom = characterselect;
				else
				{
					targetRoom = Finalintro;
					ini_write_string("Game", "character", character);
				}
				
				if character == ""
					character = "P";
				
				//if global.swapmode
				//	character = global.swap_characters[global.swap_index];
				
				obj_savesystem.ini_str = ini_close();
				gamesave_async_save();
			}
		}
		with instance_create(x, y, obj_fadeout)
		{
			gamestart = true;
			restarttimer = true;
		}
		icon_alpha = 0;
		with obj_achievementtracker
		{
			achievement_get_steam_achievements(achievements_update);
			achievement_get_steam_achievements(achievements_notify);
		}
		with instance_create(0, 0, obj_loadingscreen)
		{
			dark = true;
			group_arr = grouparr;
			offload_arr = ["menugroup"];
		}
	}
}

if state != 0
{
	showicon = true;
	icon_alpha = 3;
}
else if showicon
{
	icon_alpha = Approach(icon_alpha, 0, 0.05);
	if icon_alpha <= 0
		showicon = false;
}
if showicon
	icon_index = (icon_index + 0.35) % icon_max;
