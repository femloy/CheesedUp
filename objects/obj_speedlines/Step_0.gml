if !instance_exists(playerid)
{
	instance_destroy();
	exit;
}

x = playerid.x;
y = playerid.y;
copy_player_scale(playerid);

if IT_FINAL && (abs(playerid.hsp) <= 0 || ((playerid.state != states.mach3 || abs(playerid.movespeed) <= 12) && (playerid.character != "S" or abs(playerid.movespeed) < 12)) || (playerid.collision_flags & colflag.secret) > 0 || playerid.cutscene || room == timesuproom)
	instance_destroy();
if !IT_FINAL && playerid.state != states.mach2 // literally how april build does it
	instance_destroy();
if room == timesuproom
	instance_destroy();
