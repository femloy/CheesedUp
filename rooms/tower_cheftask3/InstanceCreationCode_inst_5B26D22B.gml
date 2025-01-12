sprite_index = spr_achievement_bosses;
if gamesave_open_ini()
{
	hidden = true;
	if ini_read_real("w3stick", "bosskey", false)
		hidden = false;
	gamesave_close_ini(false);
}

achievement = "noise";
desc_override = "boss";
index = 2;
secretplus = 5;
