up = SCREEN_HEIGHT + 20;
image_speed = 0.35;

spr = spr_itspizzatime;
if SUGARY_SPIRE && check_sugarychar()
	spr = spr_sugarrush;
if BO_NOISE && check_char("BN")
	spr = spr_tuctime;
