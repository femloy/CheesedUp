if !instance_exists(playerid)
{
	instance_destroy();
	exit;
}

x = playerid.x;
y = playerid.y;
copy_player_scale(playerid);
