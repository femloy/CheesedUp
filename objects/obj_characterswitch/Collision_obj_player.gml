with other
{
	if other.cyop
	{
		if !other.touching
		{
			if other.char_previous != noone
			{
				character = other.char_previous;
				noisetype = other.noisetype_previous;
			
				other.char_previous = noone;
			}
			else
			{
				other.char_previous = character;
				other.noisetype_previous = noisetype;
				
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
			scr_characterspr();
			
			key_taunt2 = true;
			scr_dotaunt();
		}
		other.touching = true;
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
		scr_characterspr();
		instance_destroy(other);
	}
}
