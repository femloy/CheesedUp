sprite_index = spr_achievement_bosses;
if gamesave_open_ini()
{
	hidden = true;
	if ini_read_real("w4stick", "bosskey", false)
		hidden = false;
	gamesave_close_ini(false);
}

achievement = "fakepep";
desc_override = "boss";
index = 3;
secretplus = 5;
