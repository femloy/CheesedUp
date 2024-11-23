function scr_player_comingoutdoor()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	hsp = 0;
	
	if c < 255
		c += 5;
	image_blend = make_colour_hsv(0, 0, c);
	
	if sprite_index != spr_Timesup && sprite_index != spr_ratmountdoorclosed
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			steppybuffer = 16;
			sound_play_3d(stepsnd, x, y);
		}
		
		if isgustavo
			sprite_index = spr_ratmountexitdoor;
		else
			sprite_index = spr_walkfront;
	}
	
	if floor(image_index) == image_number - 1
	{
		movespeed = 0;
		if isgustavo
			state = states.ratmount;
		else
		{
			state = states.normal;
			if character == "P" && keydoor
			{
				image_index = 0;
				sprite_index = spr_player_keydoor;
				idle = 150;
			}
		}
		
		image_alpha = 1;
		c = 0;
		image_blend = c_white;
		keydoor = false;
		
		if character == "N" && room == freezer_1
		{
			state = states.animation;
			sprite_index = spr_playerN_freezerintro;
			image_index = 0;
			xscale = 1;
			sound_play_3d("event:/sfx/playerN/freezerintro", x, y);
			exit;
		}
		
		if character == "V" && room == farm_2
		{
			state = states.actor;
			instance_create_unique(0, 0, obj_vigihook_cutscene);
			exit;
		}
	}
	image_speed = 0.35;
}
