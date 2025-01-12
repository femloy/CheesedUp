sprite_index = spr_achievement_bosses;
if gamesave_open_ini()
{
	hidden = true;
	if ini_read_real("Highscore", "exit", 0) > 0
		hidden = false;
	gamesave_close_ini(false);
}

achievement = "pizzaface";
desc_override = "boss";
index = 4;
secretplus = 5;
