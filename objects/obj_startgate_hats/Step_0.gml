image_alpha = Approach(image_alpha, 1, 0.1);
switch (state)
{
	case 0:
		var _found = false;
		for (var i = 0; i < array_length(hats_arr); i++)
		{
			if (hats_arr[i][0] <= 25)
				hats_arr[i][0] += grav;
			hats_arr[i][1] += hats_arr[i][0];
			if (hats_arr[i][1] >= 0)
				hats_arr[i][1] = 0;
			else
				_found = true;
		}
		if (!_found)
		{
			state++;
			rank_scale = 2;
		}
		break;
	case 1:
		rank_scale = Approach(rank_scale, 1, 0.1);
		break;
}

var char = obj_player1.character;
if char != char_prev
{
	var custom = scr_modding_character(char);
	if custom != noone
		sprite_index = custom.sprites.misc[$ "spr_bossfight_playerhp"] ?? spr_bossfight_playerhp;
	else
	{
		switch char
		{
			case "P": sprite_index = spr_bossfight_playerhp; break;
			case "V": sprite_index = spr_bossfight_vigiHP; break;
			case "N": sprite_index = spr_bossfight_noiseHP; break;
			case "M": sprite_index = spr_bossfight_pepperhp; break;
		}
	}
	char_prev = char;
}
