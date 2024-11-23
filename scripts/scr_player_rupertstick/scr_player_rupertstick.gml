function scr_player_rupertstick()
{
	SS_CODE_START;
	
	doublejump = false;
	jumpstop = true;
	momemtum = false;
	hsp = 0;
	vsp = 0;
	if (!(check_solid(x + xscale, y, 1)) && sprite_index == spr_player_skatewallrun)
	{
		sprite_index = spr_player_skatefall;
		xscale *= -1;
		movespeed = xscale * 5;
		state = states.rupertjump;
	}
	if (floor(image_index) >= image_number - 1)
	{
		if (sprite_index == spr_player_skatewallrun)
		{
			sprite_index = spr_player_skatewalljumpstart;
			image_index = 0;
			xscale *= -1;
			vsp = -13;
			movespeed = xscale * 10;
			state = states.rupertjump;
		}
		else
		{
			state = states.rupertnormal;
			sprite_index = spr_player_skateidle;
			freefallsmash = 0;
		}
	}
	if (sprite_index == spr_player_skatewallrun)
		image_speed = 0.5;
	else
		image_speed = 0.35;
	
	SS_CODE_END;
}