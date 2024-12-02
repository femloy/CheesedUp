up = SCREEN_HEIGHT + 20;
sprite_index = spr_itspizzatime;

if SUGARY_SPIRE && check_sugarychar()
	sprite_index = spr_sugarrush;
if BO_NOISE && check_char("BN")
	sprite_index = spr_tuctime;
