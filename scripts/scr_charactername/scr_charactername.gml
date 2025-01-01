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
	
	var custom = scr_modding_character(character);
	if custom != noone
		return custom.name;
	
	return "Unknown";
}
