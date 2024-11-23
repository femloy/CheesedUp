function scr_player_ratmountattack()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	image_speed = 0.35;
	hsp = xscale * movespeed;
	vsp = 0;
	move = key_left + key_right;
	landAnim = false;
	if (movespeed < 10 && grounded)
		movespeed += 0.5;
	else if (!grounded)
		movespeed = 10;
	if (key_jump && !doublejump)
	{
		doublejump = true;
		vsp = -11;
		state = states.ratmountjump;
		jumpstop = false;
		sprite_index = spr_ratmount_walljump;
	}
	if (floor(image_index) == (image_number - 1))
		state = states.ratmount;
	if (scr_solid(x + xscale, y) && (!check_slope(x + sign(hsp), y) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
		ledge_bump((vsp >= 0) ? 32 : 22);
}
