if sprite_index == idlespr
{
	showmoney = place_meeting(x, y, obj_player);
	if (showmoney && obj_player1.key_up2 && (global.pigtotal - global.pigreduction) >= maxscore)
	{
		sprite_index = smilespr;
		if (obj_player1.character == "N" || global.swapmode)
			alarm[0] = 100;
		sound_play_3d("event:/sfx/misc/kashing", x, y);
		instance_destroy(uparrowID);
		if gamesave_open_ini()
		{
			ini_write_real("w5stick", "mooneyunlocked", true);
			gamesave_close_ini(true);
			gamesave_async_save();
		}
		notification_push(notifs.mrmooney_donated, [room]);
		with obj_palettedresser
		{
			var _clothes = (obj_player1.character == "N" || global.swapmode) ? "feminine" : "mooney";
			for (var j = 0; j < array_length(player_palettes); j++)
			{
				var pals = player_palettes[j];
				for (var i = 0; i < array_length(pals); i++)
				{
					if pals[i][0] == _clothes
					{
						player_palettes[j][i][1] = true;
						break;
					}
				}
			}
		}
		instance_destroy(obj_pigtotal);
	}
}
else
{
	showmoney = false;
	if sprite_index == spr_noisetterabbit_jump
	{
		y += vsp;
		if y < -200
			instance_destroy();
	}
}
if obj_player1.character == "N" && x != obj_player1.x
	image_xscale = sign(obj_player1.x - x);
money_y = Wave(-5, 5, 2, 2);
