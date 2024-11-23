function scr_player_ratmount()
{
	if character == "V"
	{
		scr_player_ratmountmort();
		exit;
	}
	
	if (global.swapmode && key_attack && key_fightball && ratmount_movespeed >= 12 && !instance_exists(obj_swapmodegrab) && !instance_exists(obj_swapdeatheffect) && !instance_exists(obj_noiseanimatroniceffect) && obj_swapmodefollow.animatronic <= 0)
	{
		sprite_index = spr_fightball;
		jump_p2 = false;
		instance_create_unique(x, y, obj_swapgusfightball);
		state = states.mach3;
		movespeed = abs(hsp);
		if (movespeed < 12)
			movespeed = 12;
		if (hsp != 0)
			xscale = sign(hsp);
		exit;
	}
	
	move = key_left + key_right;
	doublejump = false;
	if (ratgrabbedID != noone && !instance_exists(ratgrabbedID))
		ratgrabbedID = noone;
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
		railmomentum = true;
	}
	hsp = movespeed + (railmovespeed * raildir);
	var r = ratmount_movespeed;
	if ((check_solid(x + xscale, y) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || !key_attack || abs(movespeed) <= 6)
	{
		gustavodash = 0;
		ratmount_movespeed = 8;
	}
	if ((check_solid(x + hsp, y) && !check_slope(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles)) && gustavodash != 51)
	{
		movespeed = 0;
		if (r >= 12)
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if (_bump)
			{
				sound_play_3d("event:/sfx/pep/groundpound", x, y);
				state = states.bump;
				if (brick)
					sprite_index = spr_ratmount_bump;
				else
					sprite_index = spr_lonegustavobump;
				image_index = 0;
				instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
				hsp = -xscale * 4;
				vsp = -5;
				shake_camera(4, 5 / room_speed);
				exit;
			}
		}
	}
	if (ratmount_movespeed >= 12 && gustavodash != 51)
	{
		particle_set_scale(part.jumpdust, REMIX ? xscale : 1, 1);
		create_particle(x, y, part.jumpdust);
		gustavodash = 51;
	}
	if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
	{
		if (!instance_exists(chargeeffectid))
		{
			with (instance_create(x, y, obj_chargeeffect))
			{
				playerid = other.object_index;
				other.chargeeffectid = id;
			}
		}
	}
	if (move != xscale && move != 0 && gusdashpadbuffer <= 0 && sprite_index != spr_lonegustavokick)
	{
		xscale = move;
		if (abs(movespeed) > 2 && abs(hsp) > 2 && grounded)
		{
			sound_play_3d("event:/sfx/pep/backslide", x, y);
			state = states.ratmountskid;
			movespeed = abs(movespeed);
		}
	}
	if (gusdashpadbuffer > 0 && movespeed != 0)
		xscale = sign(movespeed);
	if (gusdashpadbuffer <= 0)
	{
		if (move != 0)
		{
			if (move == xscale)
				movespeed = Approach(movespeed, xscale * ratmount_movespeed, 0.5);
			else
				movespeed = Approach(movespeed, 0, 0.5);
		}
		else
			movespeed = Approach(movespeed, 0, 0.5);
	}
	else
	{
		if !check_char("G")
			ratmount_movespeed = 12;
		movespeed = xscale * ratmount_movespeed;
	}
	if (abs(movespeed) > 2)
		image_speed = abs(movespeed) / 12;
	else
		image_speed = 0.35;
	if (sprite_index == spr_ratmount_mach3 || sprite_index == spr_lonegustavomach3)
		image_speed = 0.4;
	var front = scr_solid(x + sign(hsp), y) && !check_slope(x + sign(hsp), y);
	if (brick)
	{
		if (!landAnim)
		{
			if (hsp != 0 && !front)
			{
				if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
					sprite_index = spr_ratmount_mach3;
				else if (key_attack)
					sprite_index = spr_ratmount_attack;
				else
					sprite_index = spr_ratmount_move;
			}
			else
			{
				image_speed = 0.35;
				if (sprite_index != spr_ratmount_idleanim)
				{
					sprite_index = spr_ratmount_idle;
					if (ratgrabbedID == noone)
					{
						if (idle < 400)
							idle++;
						if (idle >= 150)
						{
							sprite_index = spr_ratmount_idleanim;
							image_index = 0;
						}
					}
				}
				else if (floor(image_index) == (image_number - 1))
				{
					idle = 0;
					sprite_index = spr_ratmount_idle;
				}
			}
		}
		if (floor(image_index) == (image_number - 1))
		{
			landAnim = false;
			if (sprite_index == spr_ratmount_land)
				sprite_index = spr_ratmount_idle;
		}
		if (sprite_index == spr_ratmount_land)
			image_speed = 0.35;
	}
	else
	{
		if (hsp != 0 && !front)
		{
			if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
				sprite_index = spr_lonegustavomach3;
			else if (key_attack)
				sprite_index = spr_lonegustavodash;
			else
				sprite_index = spr_lonegustavowalk;
		}
		else
			sprite_index = spr_lonegustavoidle;
		image_speed = 0.35;
	}
	if (hsp != 0 && grounded && vsp > 0 && !front)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, part.cloudeffect, 0);
			steppybuffer = 18;
			if (sprite_index != spr_player_ratmountattack)
				sound_play_3d(stepsnd, x, y);
		}
	}
	if (input_buffer_jump > 0 && can_jump && (gusdashpadbuffer == 0 or check_char("G")) && state != states.ratmountskid)
	{
		input_buffer_jump = 0;
		particle_set_scale(part.highjumpcloud2, xscale, 1);
		create_particle(x, y, part.highjumpcloud2, 0);
		scr_fmod_soundeffect(jumpsnd, x, y);
		if (brick)
		{
			if ((ratmount_movespeed >= 12 && key_attack) || gusdashpadbuffer > 0)
				sprite_index = spr_ratmount_dashjump;
			else
				sprite_index = spr_ratmount_jump;
		}
		else if ((ratmount_movespeed >= 12 && key_attack) || gusdashpadbuffer > 0)
			sprite_index = spr_lonegustavodashjump;
		else
			sprite_index = spr_ratmount_groundpound;
		image_index = 0;
		jumpAnim = true;
		state = states.ratmountjump;
		vsp = -11;
		jumpstop = false;
	}
	if (!grounded && sprite_index != spr_ratmount_swallow)
	{
		state = states.ratmountjump;
		jumpAnim = false;
		if (ratmount_movespeed >= 12)
		{
			if (brick)
				sprite_index = spr_ratmount_dashjump;
			else
				sprite_index = spr_lonegustavodashjump;
		}
		else if (brick)
			sprite_index = spr_ratmount_fall;
		else
			sprite_index = spr_ratmount_groundpoundfall;
	}
	if (key_attack && grounded && !check_solid(x + xscale, y))
	{
		move = xscale;
		if (ratmount_movespeed < 12)
			ratmount_movespeed = Approach(ratmount_movespeed, 12, 0.15);
	}
	if (((scr_slapbuffercheck() && key_up) || key_shoot2) && brick && gusdashpadbuffer == 0)
	{
		scr_resetslapbuffer();
		ratmount_kickbrick();
		if (state == states.ratmountskid)
		{
			movespeed = -movespeed;
			hsp = movespeed;
		}
	}
	if (scr_slapbuffercheck() && !key_up && gusdashpadbuffer == 0)
	{
		particle_set_scale(part.jumpdust, xscale, 1);
		create_particle(x, y, part.jumpdust, 0);
		scr_resetslapbuffer();
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
				wait = true;
		}
		brick = false;
		ratmountpunchtimer = 25;
		gustavohitwall = false;
		state = states.ratmountpunch;
		image_index = 0;
		if (move != 0)
			xscale = move;
		movespeed = xscale * 12;
		sprite_index = spr_lonegustavopunch;
	}
	if (!instance_exists(dashcloudid) && grounded && ratmount_movespeed >= 12)
	{
		var p = instance_create(x, y, obj_dashcloud)
		with p
		{
			copy_player_scale(other);
			other.dashcloudid = id;
		}
		if place_meeting(x, y + 1, obj_water)
			p.sprite_index = spr_watereffect;
	}
	if ((key_down && grounded && vsp > 0 && gusdashpadbuffer <= 0) || scr_solid(x, y))
	{
		if check_char("G") && ratmount_movespeed >= 12
		{
			particle_set_scale(part.jumpdust, xscale, 1);
			create_particle(x, y, part.jumpdust);
			movespeed = max(abs(movespeed), 2);
			crouchslipbuffer = 25;
			sprite_index = spr_lonegustavo_roll; // rolling
			machhitAnim = false;
			state = states.tumble;
			fmod_event_instance_play(snd_crouchslide);
		}
		else
			state = states.ratmountcrouch;
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
				wait = true;
		}
		brick = false;
	}
	with (ratgrabbedID)
		scr_enemy_ratgrabbed();
	ratmount_shootpowerup();
	ratmount_dotaunt();
}
function ratmount_dotaunt()
{
	if (key_taunt2 && state != states.backbreaker && brick && gusdashpadbuffer == 0)
	{
		notification_push(notifs.taunt, [room]);
		tauntstoredisgustavo = true;
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredratmount_movespeed = ratmount_movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		tauntstoredvsp = vsp;
		state = states.backbreaker;
		if ((!key_up || !supercharged) && global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && (global.panic == true || instance_exists(obj_wartimer)) && global.combotime > 0 && global.leveltosave != "grinch")
		{
			if REMIX
				global.combotime = min(global.combotime + 10, 60);
			global.heattime = 60;
			global.tauntcount++;
			global.collect += 25;
			with (instance_create(x, y, obj_smallnumber))
				number = string(25);
			create_collect(x, y, spr_taunteffect, 25);
			scr_sound_multiple(global.snd_collect, x, y);
		}
		if (!supercharged || !key_up)
		{
			scr_create_parryhitbox();
			if global.palettetexture == spr_pattern_supreme
				sound_play_3d("event:/modded/sfx/instinct", x, y);
			else
				sound_play_3d("event:/sfx/pep/taunt", x, y);
			sprite_index = spr_ratmount_taunt;
			image_index = irandom(sprite_get_number(sprite_index) - 1);
			with (instance_create(x, y, obj_taunteffect))
				player = other.id;
		}
		else if (supercharged && key_up)
		{
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real("Game", "supertaunt", true);
			obj_savesystem.ini_str = ini_close();
			sound_play_3d("event:/sfx/pep/supertaunt", x, y);
			sprite_index = spr_ratmount_supertaunt;
			image_index = 0;
		}
	}
}
function ratmount_kickbrick()
{
	var _pad = 32;
	sound_play_3d("event:/sfx/enemies/killingblow", x + (image_xscale * _pad), y);
	
	if check_char("G")
	{
		var dir = key_left + key_right;
		if dir != 0
			xscale = dir;
	}
	
	with (instance_create(x + (image_xscale * _pad), y, obj_brickball))
	{
		if (other.state == states.ratmountjump || other.state == states.ratmountbounce)
			up = true;
		image_xscale = other.xscale;
		xoffset = _pad;
	}
	state = states.ratmountgroundpound;
	sprite_index = spr_lonegustavokick;
	image_index = 0;
	image_speed = 0.35;
	gustavokicktimer = 5;
	brick = false;
}
function ratmount_shootpowerup()
{
	if (key_shoot2 && ratpowerup != noone && ratshootbuffer <= 0)
	{
		switch (ratpowerup)
		{
			case obj_noisegoblin:
				with (instance_create(x + (20 * xscale), y, obj_playernoisearrow))
					direction = point_direction(x, y, x + (other.xscale * 4), y);
				break;
			case obj_smokingpizzaslice:
				with (instance_create(x + (20 * xscale), y + 20, obj_playersmokehitbox))
				{
					spd += (other.movespeed / 2);
					image_xscale = other.xscale;
				}
				break;
			case obj_spitcheese:
				with (instance_create(x + (20 * xscale), y, obj_playerspikecheese))
				{
					spd += other.movespeed;
					image_xscale = other.xscale;
				}
				break;
		}
		ratshootbuffer = 30;
	}
}
