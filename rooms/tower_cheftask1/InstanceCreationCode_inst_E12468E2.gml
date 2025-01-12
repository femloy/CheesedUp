sprite_index = spr_achievement_bosses;
if gamesave_open_ini()
{
	hidden = true;
	if ini_read_real("w1stick", "bosskey", false)
		hidden = false;
	gamesave_close_ini(false);
}
achievement = "pepperman";
desc_override = "boss";
index = 0;
secretplus = 5;
