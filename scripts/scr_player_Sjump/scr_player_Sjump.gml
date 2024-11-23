function scr_player_Sjump()
{
	move = key_right + key_left;
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	superjumped = true;
	
	var vigilante = character == "V" && substate != states.Sjump;
	if (sprite_index == spr_superjump)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), part.cloudeffect, 0);
			steppybuffer = 8;
		}
		if global.afterimage == 1
		{
			if (punch_afterimage > 0 && REMIX)
				punch_afterimage--;
			else
			{
				punch_afterimage = 5;
				with (create_blue_afterimage(x, y, sprite_index, image_index, xscale))
		        {
		            playerid = other.id;
		            maxmovespeed = 6;
		        }
			}
		}
		if (piledrivereffect > 0)
			piledrivereffect--;
		else
		{
			with (instance_create(x, y, obj_parryeffect))
			{
				sprite_index = spr_piledrivereffect;
				image_yscale = -1;
			}
			piledrivereffect = 15;
		}
	}
	
	if ((sprite_index == spr_superjump && !vigilante) || sprite_index == spr_superspringplayer)
		vsp = sjumpvsp;
	sjumpvsp -= 0.1;
	if (vigilante && image_index > 3)
		vsp = -11;
	
	if !vigilante && image_index >= 8 && sprite_index == spr_playerV_superjump
		image_index = 5;
	
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++;
		hsp = xscale * a;
		vsp = 0;
	}
	if (scr_solid_player(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		var mb = instance_place(x, y - 1, obj_metalblock);
		if !mb or !SUGARY
		{
			pizzapepper = 0;
			a = 0;
			if (sprite_index == spr_player_supersidejump)
				sprite_index = spr_player_supersidejumpland;
			if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
				sprite_index = spr_superjumpland;
			shake_camera(10, 30 / room_speed);
			with (obj_baddie)
			{
				if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
				{
					image_index = 0;
					if (grounded)
						vsp = -7;
				}
			}
			sound_play_3d("event:/sfx/pep/groundpound", x, y);
			image_index = 0;
			state = states.Sjumpland;
			machhitAnim = false;
		}
	}
	
	// sjump cancel (stays in this state)
	else if ((key_attack2 or scr_slapbuffercheck()) && !vigilante && character != "S" && (sprite_index != spr_superspringplayer or SUGARY) && sprite_index != spr_Sjumpcancelstart)
	{
		scr_resetslapbuffer();
		if IT_FINAL or CHAR_POGONOISE
		{
			if !CHAR_BASENOISE
			{
				image_index = 0;
				sprite_index = spr_Sjumpcancelstart;
		
				sound_instance_move(sjumpcancelsnd, x, y);
				if CHAR_OLDNOISE
					sound_play_3d(sfx_woag, x, y);
				fmod_event_instance_play(sjumpcancelsnd);
			
				if SUGARY_SPIRE
				{
					if character == "SN"
						jetpackcancel = true;
				}
			}
			else
			{
				image_speed = 0.5;
				input_buffer_shoot = 0;
				if (move != 0)
					xscale = move;
				input_buffer_slap = 0;
				key_slap = false;
				key_slap2 = false;
				jumpstop = true;
				vsp = -5;
				state = states.mach2;
				movespeed = 12;
				sprite_index = spr_playerN_sidewayspin;
				image_index = 0;
				with (instance_create(x, y, obj_crazyrunothereffect))
					image_xscale = other.xscale;
				particle_set_scale(part.jumpdust, xscale, 1);
				create_particle(x, y, part.jumpdust, 0);
				return true;
			}
		}
		else
		{
			// old one
			if move != 0
				xscale = move;
			
			sprite_index = spr_mach4;
			state = states.mach3;
			movespeed = 12;
		}
	}
	
	// snick's cancel
	if character == "S" && sprite_index == spr_superjump && (key_attack2 or input_buffer_slap > 0 or input_buffer_grab > 0)
	{
		if move != 0
			xscale = sign(move);
		state = states.jump;
		movespeed = 12 * xscale;
		if !key_jump2
			vsp = -4;
		jumpstop = false;
		sprite_index = spr_walljumpstart;
		sound_play_3d("event:/modded/sfx/kungfu", x, y);
	}
	
	// handle sjump cancel
	if sprite_index == spr_Sjumpcancelstart
	{
		vsp = 0;
		if (move != 0)
			xscale = move;
		if (floor(image_index) == (image_number - 1))
		{
			jumpstop = true;
			if !jetpackcancel
				vsp = -4;
			flash = true;
			movespeed = 13;
			image_index = 0;
			sprite_index = spr_Sjumpcancel;
			state = states.mach3;
			with (instance_create(x, y, obj_crazyrunothereffect))
				copy_player_scale(other);
		}
	}
	
	if (CHAR_POGONOISE && sprite_index == spr_superjump)
	{
		if key_jump2
		{
			jumpstop = false;
			vsp = -15;
			state = states.jump;
			sprite_index = spr_playerN_noisebombspinjump;
			image_index = 0;
			with (instance_create(x, y, obj_jumpdust))
				copy_player_scale(other);
		}
		else
			hsp = move * 3;
	}
	
	if (CHAR_BASENOISE && sprite_index == spr_superjump)
		hsp = move * 3;
	
	if SUGARY_SPIRE
	{
		if character == "SN"
		{
			if move != 0
				xscale = move;
			jetpackcancel = true;
		}
	}
	
	if (vigilante && floor(image_index) == (image_number - 1) && sprite_index != spr_superspringplayer)
	{
		state = states.jump;
		sprite_index = spr_fall;
	}
	
	if state != states.Sjump
		substate = states.normal;
	
	image_speed = 0.5;
	scr_collide_player();
}
