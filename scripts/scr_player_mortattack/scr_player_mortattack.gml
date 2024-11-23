function scr_player_mortattack()
{
	image_speed = 0.45;
	hsp = movespeed;
	
	if (character == "N")
	{
		if (instance_exists(mortprojectileID) && instance_exists(mortprojectileID.target) && mortprojectileID.target.object_index == obj_morthook)
		{
			targethsp = Approach(targethsp, 0, 0.8);
			targetvsp = Approach(targetvsp, 0, 0.8);
			hsp = targethsp;
			vsp = targetvsp;
		}
		else
		{
			vsp -= 0.2;
			move = key_left + key_right;
			if (move != 0)
				movespeed = Approach(movespeed, move * 4, 0.1);
		}
		if (floor(image_index) == (image_number - 1))
			image_index = image_number - 1;
	}
	
	if ((character != "N" && floor(image_index) == image_number - 1) || (character == "N" && !instance_exists(mortprojectileID)))
	{
		if (grounded && vsp > 0)
		{
			state = states.mort;
			sprite_index = spr_playermortidle;
			landAnim = false;
		}
		else
		{
			state = states.mortjump;
			sprite_index = spr_playermortjump;
		}
	}
	
	if (punch_afterimage > 0)
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		create_blue_afterimage(x, y, sprite_index, image_index, xscale);
	}
}
