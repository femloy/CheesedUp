function copy_player_scale(playerid, no_xscale = false)
{
	image_xscale = (no_xscale ? 1 : playerid.xscale) * playerid.col_scale;
	image_yscale = playerid.yscale * playerid.col_scale;
}
function scaled_player_y(playerid)
{
	if live_call(playerid) return live_result;
	return playerid.y - (46.5 - (46.5 * playerid.col_scale));
}
