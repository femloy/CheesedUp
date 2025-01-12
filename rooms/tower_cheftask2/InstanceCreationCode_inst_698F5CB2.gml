sprite_index = spr_achievement_bosses;
if gamesave_open_ini()
{
	hidden = true;
	if ini_read_real("w2stick", "bosskey", false)
		hidden = false;
	gamesave_close_ini(false);
}
achievement = "vigilante";
desc_override = "boss";
index = 1;
secretplus = 5;
