with obj_player
{
	/*if character == "V"
		continue;*/
	
	if (state == states.knightpepslopes || state == states.rocket) && (place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other))
		instance_destroy(other);
	with other
	{
		if place_meeting(x, y - 1, other) && (other.state == states.knightpep || other.state == states.hookshot)
			instance_destroy();
	}
}
