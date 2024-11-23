if !eaten
{
	var player = instance_place(x - 1, y, obj_player);
	if !player
		player = instance_place(x + 1, y, obj_player);

	with player
	{
		if state == states.mort
		{
			movespeed = abs(movespeed);
			other.eaten = true;
			grav = 0.5;
			state = states.normal;
		}
	}
}

if eaten
{
	x = -100;
	y = -100;
	sprite_index = spr_corneaten;
	
	if !in_saveroom()
		add_saveroom();
}
