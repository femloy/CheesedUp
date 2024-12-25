eggplant = global.hud == HUD_STYLES.minimal;
sprite = spr_comboend_title1;
playerid = obj_player1;

combo = 0;
comboscore = 0;
comboscoremax = 0;
combominus = 0;
timer_max = 1;
timer = 0;
title_index = 0.35;
very = false;
depth = obj_particlesystem.depth - 1;
alarm[0] = 1;

if !eggplant
{
	x = SCREEN_WIDTH - 128;
	y = 197;
	ystart = y;
	depth = -300;
}

if SUGARY_SPIRE
{
	sugary = check_sugarychar();
	if sugary
		sprite = spr_comboend_titleSP;
}
if BO_NOISE
{
	bo = obj_player1.character == "BN";
	if bo
		sprite = spr_comboend_titleBN;
}
