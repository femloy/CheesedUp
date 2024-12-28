event_inherited();
walkspr = spr_playerN_move;
idlespr = spr_playerN_panicidle;
spr_palette = spr_noiseboss_palette;
paletteselect = 2;
use_palette = true;
image_speed = 0.35;

if obj_player1.character == "N" || global.swapmode
{
	walkspr = spr_bucket;
	idlespr = spr_bucket;
	sprite_index = spr_bucket;
	use_palette = false;
}
