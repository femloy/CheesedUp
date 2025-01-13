enum noisetype
{
	base,
	pogo
}

#macro CHAR_OLDNOISE (obj_player1.character == "N" && !IT_updated_noise())
#macro CHAR_BASENOISE (obj_player1.character == "N" && IT_updated_noise())
#macro CHAR_POGONOISE (false)

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
		var add_character = function(char, spr_idle, spr_palette, color_index, mixing_color, spr_dead, spr_shirt, default_palette = 0, pattern_color_array = scr_color_array(char))
		{
			if char == "S" && !global.experimental
				exit;
			if global.sandbox or obj_player1.character == char
			{
				array_push(characters,
				{
					char: char,
					spr_idle: spr_idle,
					spr_palette: spr_palette,
					spr_shirt: spr_shirt,
					spr_dead: spr_dead,
					color_index: color_index,
					mixing_color: mixing_color,
					default_palette: default_palette, // default selection. for pep it's 1.
					pattern_color_array: pattern_color_array
				});
			}
		}
	}
	else if type == 2
	{
		characters = {};
		var add_character = function(char, spr_idle, spr_palette, color_index, mixing_color, default_palette = 0)
		{
			characters[$ char] = { spr_palette: spr_palette, paletteselect: default_palette };
		}
	}
	else
	{
		var add_character = function(char, spr_idle, spr_palette)
		{
			pal_swap_index_palette(spr_palette);
		}
	}
	 
	add_character("P", spr_player_idle, spr_peppalette, 1, 5, spr_player_dead, spr_palettedresserdebris, 1);
	add_character("N", spr_playerN_idle, spr_noisepalette, 1, 7, spr_playerN_hurt, spr_palettedresserdebrisN, 1);
	
	add_character("V", spr_playerV_idle, spr_vigipalette, 1, 5, spr_playerV_dead, spr_palettedresserdebrisV, 0);
	add_character("G", spr_player_ratmountidle, spr_peppalette, 1, 3, spr_player_ratmounthurt, spr_palettedresserdebris, 1);
	
	add_character("S", spr_snick_idle, spr_snickpalette, 1, 4, spr_snick_stunned, spr_palettedresserdebrisS);
	
	if (irandom(100) == 0 && type == 1) or (DEBUG && keyboard_check(ord("D")))
		add_character("D", spr_playerN_idle, spr_noisepalette, 1, 7, spr_playerN_hurt, spr_palettedresserdebrisN, 17);
	
	if type != 0
	{
		var charlist = scr_charlist(true);
		while array_length(charlist)
		{
			var char_name = array_shift(charlist);
			var character = scr_modding_character(char_name);
			if character == noone
				continue;
			var general = character.get_general();
			add_character(general.char, general.spr_idle, general.spr_palette, general.color_index, general.mixing_color, general.spr_dead, general.spr_shirt, general.default_palette, general.pattern_color_array);
		}
	}
}
