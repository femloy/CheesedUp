enum noisetype
{
	base,
	pogo
}

#macro CHAR_OLDNOISE (obj_player1.character == "N" && !IT_FINAL)
#macro CHAR_BASENOISE (obj_player1.character == "N" && obj_player1.noisetype == noisetype.base && IT_FINAL)
#macro CHAR_POGONOISE (obj_player1.character == "N" && obj_player1.noisetype == noisetype.pogo)

#macro SKIN_SNOTTY 17

function check_char(char)
{
	if is_array(char)
	{
		with obj_player1
		{
			if array_contains(char, character) or (array_contains(char, "G") && isgustavo && REMIX)
				return true;
		}
	}
	else
	{
		with obj_player1
		{
			if character == char or (char == "G" && isgustavo && REMIX)
				return true;
		}
	}
	return false;
}
function check_sugarychar()
{
	if SUGARY_SPIRE
	{
		with obj_player1
			return character == "SP" or character == "SN";
		with obj_pause
			return character == "SP" or character == "SN";
	}
	return false;
}
function scr_characters(type)
{
	if type == 1
	{
		characters = [];
		var add_character = function(char, spr_idle, spr_palette, color_index, mixing_color, default_palette = 0, color_count = noone)
		{
			if char == "S" && !global.experimental
				exit;
			if global.sandbox or obj_player1.character == char
			{
				array_push(characters, {
					char: char,
					spr_idle: spr_idle,
					spr_palette: spr_palette,
					color_index: color_index,
					mixing_color: mixing_color,
					color_count: color_count,
					default_palette: default_palette, // default selection. for pep it's 1.
					pattern_color_array: scr_color_array(char)
				});
			}
		}
	}
	else if type == 2
	{
		characters = {};
		var add_character = function(char, spr_idle, spr_palette, color_index)
		{
			characters[$ char] = { spr_palette: spr_palette, paletteselect: color_index };
		}
	}
	else
	{
		var add_character = function(char, spr_idle, spr_palette)
		{
			pal_swap_index_palette(spr_palette);
		}
	}
	 
	add_character("P", spr_player_idle, spr_peppalette, 1, 5, 1);
	add_character("N", spr_playerN_idle, spr_noisepalette, 1, 7, 1);
	
	add_character("V", spr_playerV_idle, spr_vigipalette, 1, 5, 0);
	add_character("G", spr_player_ratmountidle, spr_peppalette, 1, 3, 1);
	
	add_character("S", spr_snick_idle, spr_snickpalette, 1, 4);
	
	if SUGARY_SPIRE
	{
		add_character("SP", spr_playerSP_idle, spr_pizzypalette, 1, 3, 1);
		//add_character("SN", spr_pizzano_idle, spr_pizzanopalette, 1, 5);
	}
	
	//if BO_NOISE
	//	add_character("BN", spr_playerBN_idle, spr_bopalette, 1, 5);
	
	//if DEBUG
	//	add_character("M", spr_pepperman_idle, spr_peppalette, 1, 5);
}
