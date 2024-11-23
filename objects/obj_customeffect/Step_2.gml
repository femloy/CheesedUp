if followplayer && instance_exists(playerid)
{
	x = playerid.x;
	y = playerid.y;
}
if is_callable(step)
	step();
