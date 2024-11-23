event_inherited();
walkspr = spr_playerN_move;
idlespr = spr_playerN_panicidle;
image_speed = 0.35;

if obj_player1.character == "N" || global.swapmode
{
	walkspr = spr_bucket;
	idlespr = spr_bucket;
	sprite_index = spr_bucket;
}
