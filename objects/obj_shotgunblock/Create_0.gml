depth = 104;
with obj_player1
{
	if check_char("G") or check_char("S")
		instance_destroy(other, false);
}
if global.blockstyle == blockstyles.old
	sprite_index = spr_targetblock_old;
