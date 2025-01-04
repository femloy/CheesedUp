function scr_player_freefallland()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	movespeed = 0;
	facehurt = true;
	start_running = true;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	
	var jump = false;
	if key_jump && global.poundjump && !IT_forced_poundjump()
		jump = true;
	else if floor(image_index) == image_number - 1
	{
		if (key_jump2 or IT_forced_poundjump()) && global.poundjump
			jump = true;
		else
		{
			if character != "S"
			{
				facehurt = true;
				sprite_index = spr_facehurtup;
				image_index = 0;
			}
			state = states.normal;
			jumpstop = true;
		}
	}
	
	if jump
	{
		scr_modmove_jump();
		if !IT_forced_poundjump()
		{
			if spr_groundpoundjump != spr_player_groundpoundjump or character == "P"
				sprite_index = spr_groundpoundjump;
			else
				sprite_index = spr_machfreefall;
		}
		else
			sprite_index = spr_machfreefall;
	}
	image_speed = 0.35;
}
