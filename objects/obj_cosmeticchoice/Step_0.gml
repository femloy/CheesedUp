live_auto_call;
event_inherited();

if move_hor != 0
{
	switch sel.side
	{
		// hat
		case 0:
			var sel_prev = sel.hat;
			sel.hat = clamp(sel.hat + move_hor, 0, array_length(hats) - 1);
			
			if sel_prev != sel.hat
			{
				sound_play(sfx_step);
				charshift[0] = move_hor * 50;
				charshift[2] = 0;
			}
			break;
		
		// pet
		case 1:
			var sel_prev = sel.pet;
			sel.pet = clamp(sel.pet + move_hor, 0, array_length(pets) - 1);
			
			if sel_prev != sel.pet
			{
				sound_play(sfx_step);
				charshift[0] = move_hor * 50;
				charshift[2] = 0;
			}
			break;
	}
}
if (sel.side == 0 && move_ver == 1)
or (sel.side == 1 && move_ver == -1)
{
	charshift[1] = move_ver * 100;
	charshift[2] = 0;
	
	sel.side = !sel.side;
	sound_play(sfx_angelmove);
	
	for(var i = 0; i < array_length(hats); i++)
	{
		if obj_player1.hat == hats[i].hat
			sel.hat = i;
	}
	for(var i = 0; i < array_length(pets); i++)
	{
		if obj_player1.pet == pets[i].pet
			sel.pet = i;
	}
}

if anim_t >= 1 && !shown_tip
{
	shown_tip = true;
	with create_transformation_tip(lstr("cosmetictip"), "cosmetictip")
		alarm[1] = 60 * 3;
}

charshift[0] = lerp(charshift[0], 0, 0.25); // hat
charshift[1] = lerp(charshift[1], 0, 0.25); // pet
charshift[2] = lerp(charshift[2], 1, 0.25); // alpha
charshift[3] = lerp(charshift[3], 1, 0.25); // alpha
