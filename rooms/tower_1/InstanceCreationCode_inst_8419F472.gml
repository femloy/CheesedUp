refresh_func = function()
{
	var t = "garbage1X";
	switch obj_player1.character
	{
		case "P": t = "garbage1"; break;
		case "N": t = "garbage1N"; break;
		case "V": t = "garbage1V"; break;
		case "G": t = "garbage1G"; break;
	}

	text = lang_get_value_granny(t);
}
refresh_func();
