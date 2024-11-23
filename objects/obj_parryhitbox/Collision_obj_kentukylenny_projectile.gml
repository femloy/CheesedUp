with other
{
	var current_hspd = abs(hsp / 2);
	var _dir = -image_xscale;
	if !other.collisioned
		obj_player1.xscale = _dir;
	image_xscale = _dir;
	hsp = _dir * current_hspd;
	team = 1;
}
if !collisioned
	event_user(0);
