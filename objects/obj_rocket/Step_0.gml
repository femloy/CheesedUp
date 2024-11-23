if (playerid != noone)
{
	visible = false;
	if (playerid.state != states.rocket && playerid.state != states.rocketslide && playerid.state != states.chainsaw)
	{
		visible = true;
		create_particle(x, y, part.genericpoofeffect);
		playerid = noone;
	}
}
else
	visible = true;
if (visible && buffer > 0)
	buffer--;
