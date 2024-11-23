refresh_func = function()
{
	switch obj_player1.character
	{
		case "P":
			text = lang_get_value_granny("garbage2");
			break;
		
		case "N":
			text = lang_get_value_granny("garbage2N");
			break;
		
		case "V":
			text = lang_get_value_granny("garbage2V");
			break;
		
		default:
			text = embed_value_string(lang_get_value_granny("garbage2X"), [scr_charactername(obj_player1.character, obj_player1.isgustavo)]);
			break;
	}
}
refresh_func();
