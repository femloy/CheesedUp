function scr_player_ratmountcrouch()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	move = key_left + key_right;
	hsp = movespeed;
	if (check_solid(x + hsp, y) && !check_slope(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles))
		movespeed = 0;
	if (move != 0)
	{
		if (move == xscale)
		{
			if (abs(movespeed) < 4)
				movespeed = Approach(movespeed, xscale * 4, 0.5);
			else
				movespeed = Approach(movespeed, xscale * 4, 0.1);
		}
		else
		{
			movespeed = Approach(movespeed, 0, 0.5);
			if (abs(movespeed) <= 0)
				xscale = move;
		}
		if (abs(movespeed) < 3 && move != 0)
			image_speed = 0.35;
		else if (abs(movespeed) > 3 && abs(movespeed) < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else
		movespeed = Approach(movespeed, 0, 0.5);
	if (!grounded)
	{
		state = states.ratmountjump;
		jumpAnim = false;
		sprite_index = spr_ratmount_groundpoundfall;
	}
	if (((grounded && !key_down) || brick) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
		state = states.ratmount;
	
	/*if !grounded && REMIX
		sprite_index = spr_lonegustavocrouchfall;
	else */if hsp != 0
		sprite_index = spr_lonegustavocrouchwalk;
	else
		sprite_index = spr_lonegustavocrouch;
}
