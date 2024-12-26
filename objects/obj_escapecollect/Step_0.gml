if (place_meeting(x, y, obj_destructibles))
	depth = 102;
else
	depth = 2;

if (global.panic || instance_exists(obj_wartimer))
{
	image_alpha = 1;
	if IT_collectible_magnet()
	{
		if (!gotowardsplayer && distance_to_object(obj_player1) < 25)
		{
			gotowardsplayer = true;
			scr_ghostcollectible();
		}
		if (gotowardsplayer == 1)
		{
			var yy = obj_player1.y;
			if obj_player1.flip < 0
				yy -= 10;
		
			move_towards_point(obj_player1.x, yy, movespeed);
			movespeed++;
		}
	}
}
else
	image_alpha = 0.35;
