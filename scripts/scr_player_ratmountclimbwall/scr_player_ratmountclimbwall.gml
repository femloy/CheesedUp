function scr_player_ratmountclimbwall()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	image_speed = 0.5;
	hsp = 0;
	vsp = 0;
	if (sprite_index != spr_ratmount_bounceside)
	{
		sprite_index = spr_ratmount_bounceside;
		image_index = 0;
	}
	else if (floor(image_index) == (image_number - 1))
		image_index = image_number - 1;
	if (!grounded && !check_solid(x + 1, y) && !check_solid(x - 1, y))
	{
		state = states.ratmountjump;
		jumpAnim = false;
		sprite_index = spr_ratmount_fall;
	}
	if (floor(image_index) == (image_number - 1))
	{
		if (key_jump2 && input_buffer_jump_negative <= 0)
		{
			state = states.ratmountbounce;
			xscale *= -1;
			vsp = -14;
			ratmount_fallingspeed = 0;
			movespeed = xscale * 10;
			sound_play_3d("event:/sfx/ratmount/walljump2", x, y);
			sprite_index = spr_ratmount_walljump;
		}
		else
		{
			state = states.ratmountjump;
			sprite_index = spr_ratmount_fall;
		}
	}
}
