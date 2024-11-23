if !instance_exists(playerid)
{
	visible = false;
	exit;
}

x = playerid.x + playerid.smoothx;
y = playerid.y;
if (playerid.grounded)
	visible = true;
else
	visible = false;
copy_player_scale(playerid);
if (!playerid.visible)
	visible = false;
