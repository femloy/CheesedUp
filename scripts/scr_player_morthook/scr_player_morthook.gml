function scr_player_morthook()
{
	//if live_call() return live_result;
	
	jumpstop = true;
	doublejump = false;
	hsp = 0;
	vsp = 0;
	if (!instance_exists(morthookID))
	{
		state = states.mortjump;
		sprite_index = spr_fall;
		exit;
	}
	image_speed = 0.35;
	x = Approach(x, morthookID.x, movespeed);
	y = Approach(y, morthookID.y, movespeed);
	if (floor(x) == morthookID.x && floor(y) == morthookID.y)
	{
		sound_play_3d("event:/sfx/mort/doublejump", x, y);
		with (morthookID)
			projectilebuffer = 20;
		vsp = -14;
		
		if character == "V"
		{
			dir = xscale;
			state = states.jump;
			jumpAnim = true;
			sprite_index = spr_jump;
			image_index = 0;
			movespeed = 12;
			jumpstop = true;
		}
		else
		{
			movespeed = xscale * 12;
			state = states.mortjump;
			sprite_index = spr_mortdoublejumpstart;
			image_index = 0;
			with (instance_create(x, y, obj_speedlinesup))
				playerid = other.id;
			repeat 4
				create_debris(x, y, spr_feather);
		}
	}
	if (sprite_index == spr_playerN_mortthrow && floor(image_index) == image_number - 1)
		image_index = image_number - 1;
}
