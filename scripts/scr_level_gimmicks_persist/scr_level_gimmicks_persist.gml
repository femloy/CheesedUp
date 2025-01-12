function scr_level_gimmicks_persist()
{
	if check_char("V") && global.leveltosave == "farm"
		global.vigiweapon = VIGI_WEAPONS.hook;
	if check_char("N") && global.leveltosave == "freezer"
		global.noisejetpack = true;
}
