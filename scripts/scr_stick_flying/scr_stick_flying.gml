function scr_stick_flying()
{
	if live_call() return live_result;
	
	var move = key_left + key_right;
	var move2 = -key_up + key_down;
	
	hsp = movespeed;
	if (sprite_index != spr_playerMS_tofly && sprite_index != spr_playerMS_bumpside) or image_index >= image_number - 1
		sprite_index = (abs(movespeed) > 6 && move != 0) ? spr_playerMS_swimming : spr_stick_helicopter;
	
	if sprite_index != spr_playerMS_tofly
	{
		vsp = Approach(vsp, move2 * 14, 0.4);
		movespeed = Approach(movespeed, move * 14, 0.4);
		
		if move != 0
			xscale = move;
		
		if check_solid(x + sign(hsp), y) or scr_solid_slope(x + sign(hsp), y)
		{
			sprite_index = spr_playerMS_bumpside;
			movespeed = sign(hsp) * -4;
		}
		
		if scr_solid(x, y + vsp) && vsp < 0 && !place_meeting(x, y + vsp, obj_destructibles)
		{
			sprite_index = spr_player_superjumpland;
			image_index = 0;
			vsp = 4;
		}
		
		if key_attack2
		{
			state = states.stick_flycancel;
			sprite_index = spr_playerMS_flycancelstart;
			image_index = 0;
		}
	}
	
	/*
	if input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		state = states.jump;
		sprite_index = spr_fall;
		hsp = movespeed;
		self.move = move;
		dir = move;
		movespeed = abs(movespeed);
	}
	*/
	
	if scr_slapbuffercheck()
		scr_stick_doattack();
	
	image_speed = 0.35;
}
function scr_stick_flyattack()
{
	if live_call() return live_result;
	
	hsp = movespeed * xscale;
	move = key_left + key_right;
	
	if movespeed < 12
		movespeed += 1;
	if vsp > -1
		vsp -= 0.5;
	
	if scr_check_groundpound2()
	{
		freefallsmash = 0;
		vsp = 12;
		image_index = 0;
		sprite_index = spr_bodyslamfall;
		state = states.freefall;
		move = key_left + key_right;
	}
	if (check_solid(x + sign(hsp), y) or scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + hsp, y, obj_destructibles)
	{
		state = states.stick_flying;
		sprite_index = spr_playerMS_bumpside;
		sound_play_3d(sfx_bumpwall, x, y);
		movespeed = xscale * -3;
	}
	
	if key_attack2
	{
		state = states.stick_flycancel;
		sprite_index = spr_playerMS_flycancelstart;
		image_index = 0;
		exit;
	}
	
	if image_index >= image_number - 1
	{
		state = states.stick_flying;
		movespeed = hsp;
	}
	image_speed = 0.35;
}
function scr_stick_flycancel()
{
	if live_call() return live_result;
	
	if sprite_index != spr_playerMS_flycancelstart or image_index >= image_number - 1
		sprite_index = spr_playerMS_flycancel;
	
	if grounded
	{
		if hsp != 0
			xscale = sign(hsp);
		if key_attack
		{
			image_index = 0;
			sprite_index = spr_dashpadmach;
			state = states.mach3;
			movespeed = 12;
		}
		else
		{
			state = states.jump;
			sprite_index = spr_fall;
			move = key_left + key_right;
			dir = move;
			movespeed = abs(hsp);
		}
	}
	
	image_speed = 0.35;
}
function scr_stick_superjump()
{
	if live_call() return live_result;
	
	hsp = 0;
	movespeed = 0;
	
	if sprite_index == spr_superjumpprep
	{
		if image_index >= image_number - 1
		{
			sprite_index = spr_superjump;
			image_index = 0;
		}
		image_speed = 0.45;
	}
	else
	{
		vsp = -14;
		if image_index >= image_number - 1
			state = states.stick_flying;
		image_speed = 0.25;
		
		if scr_solid(x, y + vsp) && vsp < 0 && !place_meeting(x, y + vsp, obj_destructibles)
		{
			sprite_index = spr_player_superjumpland;
			image_index = 0;
			sound_play_3d(sfx_bumpwall, x, y);
			vsp = 4;
			state = states.stick_flying;
		}
	}
}
function scr_stick_doattack()
{
	if live_call() return live_result;
	
	move = key_left + key_right;
	if move != 0
		xscale = move;
	
	scr_resetslapbuffer();
	if state != states.stick_flying
		movespeed = 4; //abs(movespeed);
	else
		movespeed = max(abs(movespeed), 8);
	state = states.stick_flyattack;
	sprite_index = spr_playerMS_flyingattack;
	image_index = 0;
	vsp = 0;
}
function scr_stick_dofly()
{
	if live_call() return live_result;
	
	image_index = 0;
	sprite_index = spr_playerMS_tofly;
	state = states.stick_flying;
	movespeed = xscale * -2;
	vsp = -6;
}
function scr_stick_jumpspeed()
{
	if live_call() return live_result;
	
	return -12;
}
