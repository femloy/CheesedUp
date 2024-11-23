function scr_player_frothstuck()
{
	SS_CODE_START;
	
	hsp = 0
	image_speed = 0.35
	if shaketime > 0 
		shaketime--
	
	if key_jump && shaketime < 6
	{
		breakout -= 1
		shaketime = 12
		sprite_index = spr_player_frothstuck_start
		image_index = 0
	}
	if image_index >= image_number - 1 && sprite_index == spr_player_frothstuck_start
		sprite_index = spr_player_frothstuck

	if breakout <= 0 
	{
		input_buffer_jump = 0;
		state = states.normal
		sprite_index = spr_idle
		with instance_create(x, y, obj_parryeffect)
			sprite_index = spr_snowcloudhit
		breakout = 0
	}
	
	SS_CODE_END;
}
