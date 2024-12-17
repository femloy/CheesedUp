if cyop
{
	if !place_meeting(x, y, obj_player)
		touching = false;
}
else if --respawn == 0 && !visible
	visible = true;
