if room == Titlescreen && obj_player.state == states.titlescreen
{
	with obj_player
	{
		sprite_index = spr_player_machfreefall;
		state = states.backbreaker;
		movespeed = 6;
		vsp = 5;
		xscale = 1;
		player_x = 50;
		player_y = 50;
	}
}
if obj_player.state == states.taxi
{
	var xx = 0, yy = 0;
	if !global.pizzadelivery
	{
		if instance_exists(obj_stopsign)
		{
			xx = obj_stopsign.x;
			yy = obj_stopsign.y;
			
			with instance_create(xx - (SCREEN_WIDTH / 2), yy, obj_taxidud)
			{
				playerid = obj_player1;
				if (obj_player1.policetaxi)
				{
					obj_player1.policetaxi = false;
					sprite_index = spr_taxicop;
				}
			}
		}
	}
	else
	{
		if instance_exists(obj_checkpoint)
		{
			xx = obj_checkpoint.x;
			yy = obj_checkpoint.y - 50;
			
			with instance_create(xx - (SCREEN_WIDTH / 2), yy, obj_taxidud)
				playerid = obj_player1;
			with obj_player
			{
				x = xx;
				y = yy;
			}
		}
	}
}
if obj_player.state == states.policetaxi
{
	with obj_player
	{
		visible = true;
		state = states.normal;
	}
}
if obj_player.state == states.spaceshuttle && instance_exists(obj_spaceshuttlestop)
	instance_create(obj_spaceshuttlestop.x, camera_get_view_y(view_camera[0]) - 50, obj_spaceshuttletrans);
