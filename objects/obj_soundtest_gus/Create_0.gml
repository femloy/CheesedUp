image_speed = 0.35;
depth = 50;

idlespr = obj_player1.spr_lonegustavoidle;
dancespr = spr_gusdance;
use_palette = true;

if check_char("G")
{
	idlespr = spr_player_idle;
	dancespr = spr_pepdance;
}

if obj_player1.character == "N" || global.swapmode
{
	idlespr = spr_noisette_idle;
	dancespr = spr_noisettedance;
	use_palette = false;
}
sprite_index = idlespr;
