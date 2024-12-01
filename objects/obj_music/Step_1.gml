if instance_exists(obj_player1)
{
	var char = 0;
	if room != Mainmenu
	{
		switch obj_player1.character
		{
			case "N": char = 1; break;
			case "V": char = 2; break;
			case "SP": char = 3; break;
		}
	}
	fmod_set_parameter("character", char, true);
}
fmod_set_parameter("swapmode", global.swapmode ? 1 : 0, true);
