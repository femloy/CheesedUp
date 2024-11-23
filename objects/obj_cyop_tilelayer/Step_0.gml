if tilelayer == noone
	exit;
if !secrettile
	exit;

if buffer > 0
	buffer--;

player = noone;
if rectangle_in_rectangle(obj_player1.bbox_left, obj_player1.bbox_top, obj_player1.bbox_right, obj_player1.bbox_bottom, tilelayer.tiles_bounds.x1, tilelayer.tiles_bounds.y1, tilelayer.tiles_bounds.x2, tilelayer.tiles_bounds.y2)
{
	var f = method(self, function(tile, i)
	{
		with obj_player1
		{
			if rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, tile.x, tile.y, tile.x + 31, tile.y + 31)
			{
				other.player = id;
				break;
			}
		}
	});
	array_foreach(tilelayer.tiles, f, 0, infinity);
}

if (player && player.state != states.chainsaw && player.state != states.backtohub) or active
{
	if buffer > 0
		image_alpha = 0;
	
	if !revealed
	{
		revealed = true;
		add_saveroom();
		
		/*
		if REMIX && buffer <= 0
		{
			sound_stop(sfx_collectpizza);
			with player
				fmod_event_instance_set_parameter(global.snd_secretwall, "state", character == "SP", false);
			fmod_event_instance_play(global.snd_secretwall);
		}
		*/
	}
	//depth = max(-8, desireddepth);
	image_alpha = Approach(image_alpha, 0, 0.1);
}
else if !(player && player.state == states.chainsaw)
{
	//depth = desireddepth;
	image_alpha = Approach(image_alpha, 1, 0.1);
}
active = false;
