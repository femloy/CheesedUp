function scr_vigi_shoot()
{
	if live_call() return live_result;
	
	var letgo = (sprite_index == spr_playerV_revolverhold or sprite_index == spr_playerV_revolverstart or sprite_index == spr_playerV_airrevolverstart);
	if (input_buffer_pistol > 0 or letgo) && pistolcooldown <= 0
	{
		input_buffer_pistol = 0;
		if key_up && state != states.crouch
		{
			state = states.punch;
			image_index = 0;
			sprite_index = spr_breakdanceuppercut;
			fmod_event_instance_play(snd_uppercut);
			vsp = vigi_uppercut_vsp();
			movespeed = hsp;
		}
		else if shotgunAnim
			scr_shotgunshoot();
		else if state == states.normal or state == states.crouch or place_meeting(x, y, obj_shotgun)
		{
			if move == 0
				movespeed = 0;
			sprite_index = spr_playerV_revolverstart;
			image_index = 0;
			state = states.revolver;
		}
		else
		{
			pistolcooldown = 10;
			if state != states.revolver
			{
				vsp = min(vsp, global.vigishoot == vigishoot.pto ? -6 : -5);
				state = states.revolver;
				sprite_index = spr_playerV_airrevolver;
			}
			else
				sprite_index = grounded ? spr_playerV_revolvershoot : spr_playerV_airrevolver;
			image_index = 0;
			
			if abs(movespeed) < 4 && grounded
				movespeed -= 2;
			
			with instance_create(x + xscale * 20, y + 10 * flip, obj_vigibullet)
			{
				is_solid = false;
				copy_player_scale(other);
				
				repeat 2
				{
					with instance_create(x, y, obj_noisedebris)
					{
						hsp = other.image_xscale * random_range(2, 8);
						sprite_index = spr_slimedebris;
					}
				}
			}
			sound_play_3d("event:/sfx/enemies/killingblow", x, y);
		}
	}
}
function scr_vigi_throw()
{
	if live_call() return live_result;
	
	if (key_chainsaw2 or key_shoot2) && !instance_exists(dynamite_inst) && !instance_exists(obj_vigihook)
	{
		if state == states.punch
		{
			if movespeed != 0
				xscale = sign(movespeed);
			if move != 0
				xscale = move;
			
			movespeed = abs(movespeed);
			vigi_uppercut_nerf++;
		}
		
		if state != states.normal && state != states.crouch
			vsp = -6;
		if move == 0 && !key_attack
			movespeed = 0;
		
		image_index = 0;
		sprite_index = spr_playerV_dynamitethrow;
		
		var mv = movespeed + 4, mv2 = floor(movespeed * 1.2);
		if state == states.normal or state == states.jump
			mv = 6;
		if state == states.crouch
			mv = 0;
		
		state = states.dynamite;
		sound_play_3d("event:/sfx/vigilante/throw", x, y);
		
		switch global.vigiweapon
		{
			case vweapons.dynamite:
				with instance_create(x, y, obj_dynamite)
				{
					image_xscale = other.xscale;
					image_yscale = other.gravityjump ? -1 : 1;
			
					other.dynamite_inst = id;
					playerid = other.id;
					countdown = 150;
			
					if other.key_up && !other.key_down
					{
						movespeed = mv2;
						vsp = -12;
						if !other.grounded
							other.vsp = -10;
					}
					else
					{
						movespeed = mv;
						vsp = -6;
					}
					flip = other.gravityjump ? -1 : 1;
				}
				break;
		
			case vweapons.hook:
				var spd = 24, move_v = (key_down - key_up), move_h = (key_right + key_left);
				with instance_create(x, y, obj_vigihook)
				{
					playerid = other.id;
					hsp = move_h * spd;
					vsp = move_v * spd;
				
					if move_h == 0 && move_v == 0
						hsp = other.xscale * spd;
				}
				break;
			
			case vweapons.rocket:
				state = states.rocket;
				create_transformation_tip(lang_get_value("rockettip"), "rocket");
				sprite_index = spr_rocketstart;
				image_index = 0;
				break;
		}
	}
}

function scr_player_revolver()
{
	if live_call() return live_result;
	
	var remix = global.vigishoot == vigishoot.pto;
	
	hsp = xscale * movespeed;
	move = key_left + key_right;
	landAnim = false;
	
	if grounded
		movespeed = Approach(movespeed, 0, remix ? 0.2 : 0.1);
	if sprite_index == spr_playerV_revolverstart
	{
		if image_index < 1 && remix
			image_index += 1;
		if floor(image_index) == image_number - 1
			sprite_index = spr_playerV_revolverhold;
	}
	
	if remix
	{
		if sprite_index == spr_playerV_revolverhold && !grounded
			sprite_index = spr_playerV_airrevolverstart;
		if sprite_index == spr_playerV_airrevolverstart && grounded
		{
			with instance_create(x, y, obj_landcloud)
				copy_player_scale(other);
			sound_play_3d(sfx_playerstep, x, y);
			image_index = 0;
			sprite_index = spr_playerV_revolverhold;
		}
	}
	
	if sprite_index == spr_playerV_revolvershoot
	{
		if floor(image_index) == image_number - 1
		{
			if !key_slap or !remix
			{
				image_index = 0;
				state = states.normal;
				sprite_index = spr_playerV_revolverend;
				movespeed = 2;
			}
			else
				sprite_index = spr_playerV_revolverhold;
		}
		else
		{
			if !key_slap
				scr_vigi_shoot();
			
			if move != 0
				movespeed = Approach(movespeed, 6 * move * xscale, .5);
		}
	}
	else if !key_slap && (sprite_index != spr_playerV_airrevolver or remix)
		scr_vigi_shoot();
	
	if key_down2
	{
		sprite_index = spr_crouchslip;
		movespeed = max(movespeed, 12);
		state = states.tumble;
		sound_play_3d(sfx_crouchslide, x, y);
	}
	
	if ((sprite_index == spr_playerV_airrevolverend || sprite_index == spr_playerV_airrevolver || sprite_index == spr_playerV_airrevolverstart)
	&& grounded)
	{
		if (key_attack && movespeed >= 6)
			state = states.mach2;
		else
			state = states.normal;
	}
	
	if sprite_index == spr_playerV_airrevolver
	{
		if floor(image_index) >= image_number - 6 && move == -xscale
		{
			sound_play_3d("event:/sfx/pep/grabcancel", x, y);
			sprite_index = spr_suplexcancel;
			jumpAnim = true;
			image_index = 0;
			
			state = states.jump;
			pistolcooldown = 25;
			xscale = move;
		}
	}
	
	if pistolcooldown <= 0
	{
		if input_buffer_jump > 0 && grounded
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			state = states.jump;
			jumpAnim = true;
			image_index = 0;
			sprite_index = spr_jump;
			vsp = -11;
			with instance_create(x, y, obj_highjumpcloud2)
				copy_player_scale(other);
		}
		
		scr_dotaunt();
		if state == states.backbreaker
		{
			tauntstoredsprite = spr_idle;
			tauntstoredstate = states.normal;
		}
	}
	
	if sprite_index == spr_playerV_airrevolver && ((floor(image_index) == image_number - 1)
	or (image_index >= image_number - 6 && key_attack && scr_solid(x + xscale, y)))
	{
		if !key_slap or !remix
		{
			if move != 0
				xscale = move;
			if (key_attack && move != 0)
			{
				movespeed = max(movespeed, 6);
				state = states.mach2;
			}
			else if !grounded
			{
				sprite_index = spr_playerV_airrevolverend;
				state = states.jump;
			}
			else
			{
				image_index = 0;
				state = states.normal;
			}
		}
		else
			sprite_index = spr_playerV_airrevolverstart;
	}
	image_speed = 0.4;
}

function scr_player_dynamite()
{
	if live_call() return live_result;
	
	switch global.vigiweapon
	{
		default:
			if (grounded)
			{
				hsp = xscale * movespeed;
				if (movespeed > 0)
					movespeed -= 0.1;
			}
			//if (grounded)
			//	hsp = 0;
			landAnim = false;
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_dynamitethrow)
			{
				if (key_attack && hsp != 0)
					state = states.mach2;
				else
					state = states.normal;
			}
			image_speed = 0.4;
			break;
		
		case vweapons.hook:
			if grounded
				hsp = Approach(hsp, 0, 0.25);
		
			var hook = obj_vigihook;
			if !instance_exists(hook) or hook.state == 10
			{
				if key_attack && hsp != 0
				{
					movespeed = min(movespeed, 6);
					state = states.mach2;
				}
				else
					state = states.normal;
				exit;
			}
		
			if hook.state == 1
			{
				sprite_index = spr_playerV_hookpull;
				if hsp != 0
					xscale = sign(hsp);
			}
		
			if hook.state == 2
			{
				hsp = 0;
				vsp = 0;
			
				if image_index >= image_number - 1
				{
					if sprite_index == spr_playerV_hookceilingstart
						sprite_index = spr_playerV_hookceiling;
					if sprite_index == spr_playerV_hookwallstart
						sprite_index = spr_playerV_hookwall;
				}
			}
		
			if input_buffer_jump > 0 && hook.state > 0
			{
				hook.state = 10;
				hook.speed = 5;
			
				input_buffer_jump = 0;
			
				image_speed = 0.35;
				if vsp > -11
					vsp = -11;
			
				if (sprite_index == spr_playerV_hookwallstart or sprite_index == spr_playerV_hookwall)
					xscale *= -1;
			
				scr_fmod_soundeffect(jumpsnd, x, y);
				if key_attack && hsp != 0
				{
					sound_play_3d("event:/modded/sfx/kungfu", x, y);
					movespeed = min(movespeed, 6);
					state = states.mach2;
				}
				else
				{
					sprite_index = spr_jump;
					state = states.jump;
					jumpAnim = true;
				}
			
				if hsp != 0
				{
					xscale = sign(hsp);
					if abs(hsp) < 16
						movespeed = min(abs(hsp) + 4, 16);
					else
						movespeed = abs(hsp);
				}
			}
		
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_dynamitethrow)
				image_speed = 0;
			else
				image_speed = 0.35;
			break;
	}
}

function scr_player_swimming()
{
	if live_call() return live_result;
	
	static shown_tip = false;
	if !shown_tip
	{
		create_transformation_tip(lstr("fireasstipV"), "fireassV", , true);
		shown_tip = true;
	}
	
	move = key_right + key_left;
	var moveV = key_down - key_up;
	if moveV == 0 && key_jump2
		moveV = -1;
	
	var flipped = flip;
	var liquid = instance_place(x, y + 1, obj_boilingsauce);
	if !liquid
		liquid = instance_place(x, y + 1, obj_water);
	
	with liquid
		flipped *= sign(image_yscale);
	
	if check_solid(x + sign(movespeed), y)
		movespeed = 0;
	hsp = movespeed;
	
	if sprite_index != spr_rockethitwall or scr_solid(x, y - 1)
	{
		var accel = 0.5;
		movespeed = Approach(movespeed, move * 10, accel);
		vsp = Approach(vsp, moveV * 10, accel);
		
		if move != 0
		{
			xscale = move;
			sprite_index = spr_playerV_swimming;
		
			image_speed = lerp(0.2, 0.4, abs(movespeed / 10));
		}
		else if moveV != 0
		{
			sprite_index = spr_playerV_swimming;
			image_speed = 0.25;
		}
		else
		{
			sprite_index = spr_playerV_swimidle;
			image_speed = 0.35;
		}
	}
	
	var edging = (liquid && y < liquid.bbox_top - 10);
	if (edging && vsp >= 0)
		vsp = max(vsp, 4);
	
	if !liquid or (edging && vsp <= 0)
	{
		if movespeed != 0
		{
			xscale = sign(movespeed);
			dir = xscale;
			movespeed = abs(movespeed);
			
			trace("xscale ", xscale, " dir ", dir, " movespeed ", movespeed);
		}
		
		sound_play("event:/sfx/misc/watersplash");
		if vsp <= 0
		{
			if flipped < 0
				vsp = max(vsp, 10);
			else
				vsp = min(vsp, -10);
			
			sprite_index = spr_jump;
			image_index = 3;
			jumpstop = true;
			state = states.jump;
			jumpAnim = true;
			scr_fmod_soundeffect(jumpsnd, x, y);
		}
		else
		{
			state = states.jump;
			sprite_index = spr_fall;
		}
	}
	else if (key_chainsaw2 or key_shoot2) && sprite_index != spr_rockethitwall
	{
		shake_camera(5, 0.1);
		instance_create(x, y, obj_dynamiteexplosion);
		sprite_index = spr_rockethitwall;
		vsp = -20 * flipped;
	}
	
	if /*(flipped < 0 && vsp < 0) or*/ (flipped > 0 && vsp > 0)
	{
		if !collision_point(x, bbox_bottom + vsp, liquid, true, false)
		{
			while collision_point(x, bbox_bottom + 1, liquid, true, false)
				y++;
			vsp = 0;
		}
	}
	
	if steppybuffer <= 0
	{
		steppybuffer = 20;
		if move != 0 or moveV != 0
		{
			var snd = sound_play_3d("event:/sfx/misc/waterslidesplash", x, y);
			fmod_event_instance_set_volume(snd, 0.5);
			sound_play_3d("event:/modded/playerV/step", x, y);
		}
	}
	steppybuffer -= lerp(0.7, 1.2, abs(movespeed) / 10);
	
	if steppybuffer == 10 && (move != 0 or moveV != 0)
		sound_play_3d("event:/modded/playerV/step", x, y);
}

function vigi_uppercut_vsp()
{
	return -(19 - vigi_uppercut_nerf * 4);
}
