function scr_player_ratmountgroundpound()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	if (sprite_index == spr_ratmount_groundpound)
	{
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_ratmount_groundpoundfall;
	}
	move = key_left + key_right;
	hsp = movespeed;
	if (brick == 1)
	{
		state = states.ratmountjump;
		sprite_index = spr_ratmount_fall;
	}
	if (gustavokicktimer > 0)
		gustavokicktimer--;
	if (gustavokicktimer == 0)
	{
		if (sprite_index == spr_lonegustavojumpstart)
		{
			vsp = -11;
			instance_create(x, y - 20, obj_bangeffect);
		}
		else
			instance_create(x + (xscale * 50), y + 20, obj_bangeffect);
		gustavokicktimer = -1;
	}
	if (sprite_index == spr_lonegustavojumpstart && gustavokicktimer > 0)
	{
		vsp = 0;
		hsp = 0;
	}
	if (move != 0)
	{
		if (sprite_index == spr_lonegustavogroundpoundland)
			movespeed = Approach(movespeed, move * ratmount_movespeed, 0.25);
		else
			movespeed = Approach(movespeed, move * ratmount_movespeed, 0.5);
	}
	else
		movespeed = Approach(movespeed, 0, 0.5);
	if (sprite_index == spr_lonegustavogroundpoundstart && floor(image_index) == (image_number - 1))
	{
		image_index = 0;
		sprite_index = spr_lonegustavogroundpound;
	}
	if (sprite_index == spr_lonegustavogroundpound || sprite_index == spr_lonegustavogroundpoundstart)
	{
		vsp++;
		if (grounded && vsp > 0 && !place_meeting(x, y + vsp + 2, obj_grindrail) && !place_meeting(x, y + 10, obj_grindrail) && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + vsp + 2, obj_destructibles) && !place_meeting(x, y + 10, obj_destructibles))
		{
			var slope = check_slope(x, y + 1, true);
			if slope
			{
				with slope
				{
					other.xscale = -sign(image_xscale);
					other.state = states.ratmount;
					other.movespeed = other.xscale * 8;
					
					particle_set_scale(part.jumpdust, -sign(image_xscale), 1);
					create_particle(other.x, other.y, part.jumpdust);
				}
			}
			else
			{
				if (move != 0)
					movespeed = xscale * 3;
				sound_play_3d("event:/sfx/pep/groundpound", x, y);
				sprite_index = spr_lonegustavogroundpoundland;
				image_index = 0;
				jumpAnim = true;
				jumpstop = false;
				shake_camera(5, 15 / room_speed);
				if (freefallsmash >= 10)
				{
					with (obj_baddie)
					{
						if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
						{
							state = states.stun;
							if (stunned < 60)
								stunned = 60;
							vsp = -11;
							image_xscale *= -1;
							hsp = 0;
							momentum = 0;
						}
					}
					shake_camera(10, 30 / room_speed);
					combo = 0;
					bounce = false;
				}
				create_particle(x, y + 3, part.groundpoundeffect, 0);
			}
		}
	}
	if (sprite_index == spr_lonegustavogroundpoundland && floor(image_index) == (image_number - 1))
	{
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		sprite_index = spr_lonegustavoidle;
		state = states.ratmount;
	}
	if ((sprite_index == spr_lonegustavokick || sprite_index == spr_lonegustavojumpstart) && floor(image_index) == (image_number - 1))
	{
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		if (sprite_index == spr_lonegustavokick)
			sprite_index = spr_ratmount_groundpoundfall;
		else
			sprite_index = spr_lonegustavojump;
		state = states.ratmount;
	}
	image_speed = 0.35;
	if (punch_afterimage > 0)
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		create_blue_afterimage(x, y, sprite_index, image_index, xscale);
	}
}
