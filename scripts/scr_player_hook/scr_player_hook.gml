function scr_player_hook()
{
	if key_jump
	{
		state = states.jump;
		sprite_index = spr_jump;
		image_index = 0;
		vsp = IT_jumpspeed();
		jumpstop = false;
	}
}
