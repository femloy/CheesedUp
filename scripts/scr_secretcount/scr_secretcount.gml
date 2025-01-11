function scr_secretcount(level)
{
	if level == "etb"
		return 2;
	if MOD.OldLevels
		return 6;
	return 3;
}
