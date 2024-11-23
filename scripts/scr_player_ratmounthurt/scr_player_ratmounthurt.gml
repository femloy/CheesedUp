function scr_player_ratmounthurt()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	hsp = -xscale * movespeed;
	landAnim = false;
	jumpAnim = false;
	hurted = true;
	gusdashpadbuffer = 0;
	if (check_solid(x + sign(hsp), y) && !check_slope(x, y + sign(hsp)))
		movespeed = 0;
	alarm[5] = 2;
	alarm[7] = 80;
	if (grounded && vsp > 0)
	{
		state = states.ratmount;
		movespeed = 0;
	}
	if (brick)
		sprite_index = spr_ratmount_hurt;
	else
		sprite_index = spr_lonegustavohurt;
	image_speed = 0.35;
}
