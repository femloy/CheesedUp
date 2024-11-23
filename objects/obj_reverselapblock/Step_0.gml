if !(global.laps >= 2)
{
	sprite_index = spr_lapblockwoke;
	x = xstart;
	y = ystart;
}
else
{
	sprite_index = spr_lapblocksleep;
	x = -10000;
	y = -10000;
}
