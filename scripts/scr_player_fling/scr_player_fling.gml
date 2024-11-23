function scr_player_fling()
{
	SS_CODE_START;
	
	suplexmove = false;
	
	image_speed = 0.35;
    if sprite_index == spr_player_candybegin && floor(image_index) == image_number - 1
        sprite_index = spr_player_candyidle;
	
	SS_CODE_END;
}