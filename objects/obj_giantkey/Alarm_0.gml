playerid.state = states.normal;
if playerid.character == "S"
	p.movespeed = 0;
if playerid.isgustavo
{
	playerid.state = states.ratmount;
	playerid.movespeed = 0;
}
playerid.landAnim = false;
instance_destroy();
