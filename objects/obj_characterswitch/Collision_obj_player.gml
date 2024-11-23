with other
{
	if other.cyop && other.charSwitch != ""
	{
		switch other.charSwitch
		{
			default:
				character = "P";
				break;
			case "Noise":
			case "Skateboard Noise":
				character = "N";
				noisetype = noisetype.base;
				break;
			case "Pogo Noise":
				character = "N";
				noisetype = noisetype.pogo;
				break;
			case "Vigilante":
				character = "V";
				break;
			case "Pepperman":
				character = "M";
				break;
		}
	}
	else
	{
		if character == "P"
		{
			character = "N";
			noisetype = noisetype.base;
		}
		else
			character = "P";
	}
	respawn = 200;
	scr_characterspr();
	instance_destroy(other);
}
