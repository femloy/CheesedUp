var slope_points = slope_get_line(id);
var obj = collision_line(slope_points[0], slope_points[1] - 1, slope_points[2], slope_points[3] - 1, obj_player, false, false);

with obj
{
	if !((state != states.tumble || (sprite_index != spr_tumble && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend)) && state != states.backbreaker && state != states.chainsaw && state != states.bump)
	or !scr_transformationcheck() or (sign(hsp) != sign(other.image_xscale) && grounded)
		continue;
	if MIDWAY && (state == states.backbreaker or vsp < 0)
		continue;
	
	var bbox_height = (bbox_bottom - bbox_top) + 2;
	while (inside_slope(other))
		y--;
	
	if !isgustavo
	{
		if (state == states.punch)
			movespeed = abs(hsp);
		
		state = states.grind;
	}
	else
	{
		if state == states.ratmounttrickjump or state == states.tumble
			movespeed *= sign(hsp);
		
		if state != states.ratmountgrind
		{
			if (brick == 1)
			{
				with (instance_create(x, y, obj_brickcomeback))
					wait = true;
			}
			
			with (instance_create(x, y - 5, obj_parryeffect))
			{
				sound_play_3d("event:/sfx/pep/step", x, y);
				sprite_index = spr_grabhangeffect;
				image_speed = 0.35;
			}
			brick = false;
		}
		
		y += bbox_height;
		state = states.ratmountgrind;
	}
}