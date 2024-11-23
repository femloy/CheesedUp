var p = noone;
if (player == 1)
	p = obj_player1.id;
else if (player == 2)
	p = obj_player2.id;
p.state = states.normal;
if p.character == "S"
	p.movespeed = 0;
if p.isgustavo
{
	p.state = states.ratmount;
	p.movespeed = 0;
}
p.landAnim = false;
