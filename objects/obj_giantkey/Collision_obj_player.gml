if (picked == 0 && pickable == 1)
{
	hsp = 0;
	vsp = 0;
	grav = 0;
	if (other.object_index == obj_player1)
		playerid = obj_player1;
	else
		playerid = obj_player2;
	alarm[0] = 150;
	y = playerid.y - 75;
	x = playerid.x;
	with (playerid)
	{
		state = states.gottreasure;
		sound_play("event:/sfx/misc/foundtreasure");
		global.giantkey = true;
	}
	global.heattime = 60;
	global.combotime = 60;
	picked = true;
}
