function scr_charactername(character, isgustavo)
{
	if character != "N" && character != "V" && isgustavo
		return "Gustavo";
	if (character == "V" && isgustavo) or character == "MORT"
		return "Mort";
	
	switch character
	{
		case "P": return "Peppino"; break;
		case "N": return "The Noise"; break;
		case "V": return "Vigilante"; break;
		case "S": return "Snick"; break;
		case "M": return "Pepperman"; break;
	}
	if SUGARY_SPIRE
	{
		if character == "SP"
			return "Pizzelle";
		if character == "SN"
			return "Pizzano";
	}
	if BO_NOISE
	{
		if character == "BN"
			return "Bo Noise";
	}
	return "Unknown";
}
