refresh_func = function()
{
	var t = "garbage13X";
	switch obj_player1.character
	{
		case "P": case "SN": case "G": case "N":
			t = "garbage13";
			break;
	}
	text = lang_get_value_granny(t);
}
refresh_func();
