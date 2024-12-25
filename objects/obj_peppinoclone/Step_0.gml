if (room == rm_editor)
	exit;

var _grounded = grounded && (vsp >= 0 or !REMIX);
var heat = global.stylethreshold >= 3;

targetplayer = instance_nearest(x, y, obj_player);
switch (state)
{
	case states.walk:
		if (targetplayer.x > (x - 700) && targetplayer.x < (x + 700) && targetplayer.y < (y + 500) && targetplayer.y > (y - 500))
		{
			var inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
			var inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
			var inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
			var inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
			
			if (_grounded && x != targetplayer.x)
				image_xscale = sign(targetplayer.x - x);
			if (cooldown > 0)
				cooldown--;
			
			var jump = true;
			if !heat
			{
				if (targetplayer.x > (x - 100) && targetplayer.x < (x + 100) && _grounded)
				{
					hsp = Approach(hsp, 0, 0.5);
					if (cooldown <= 0)
					{
						state = states.punch;
						sprite_index = spr_pepclone_attack;
						image_index = 0;
						shot = false;
					}
				}
				else
					hsp = image_xscale * 6;
			}
			else
			{
				var force_move = false;
				if targetplayer.y >= y - 64 or targetplayer.vsp < -5
					jump = false;
				if cooldown <= 10 && targetplayer.y < y && _grounded
					jump = 2;
				
				if targetplayer.y > y && _grounded && place_meeting(x, y + 1, obj_platform)
				{
					for(var i = x; i > x - 960; i -= 32)
					{
						if check_solid(i, y)
							break;
						if !scr_solid(i, y + 1)
						{
							image_xscale = -1;
							force_move = true;
							break;
						}
					}
					for(var i = x; i < x + 960; i += 32)
					{
						if check_solid(i, y)
							break;
						if !scr_solid(i, y + 1)
						{
							image_xscale = -1;
							force_move = true;
							break;
						}
					}
				}
				
				if abs(targetplayer.x - x) < 200 && !force_move
				{
					hsp = Approach(hsp, 0, 0.5);
					if --cooldown <= 0 && abs(targetplayer.y - y) < 64 && (_grounded or vsp < 0)
					{
						create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
						if global.attackstyle == ATTACK_STYLES.kungfu or global.attackstyle == ATTACK_STYLES.shoulderbash
						{
							sound_play_3d("event:/modded/sfx/kungfu", x, y);
							state = states.punch;
							image_index = 0;
							shot = false;
							
							hsp = image_xscale * 10;
							if vsp > 0
								vsp = 0;
							
							if _grounded
								sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
							else
								sprite_index = choose(spr_player_kungfuair1, spr_player_kungfuair2, spr_player_kungfuair3);
						}
						else
						{
							sound_play_3d(sfx_suplexdash, x, y);
						
							state = states.handstandjump;
							sprite_index = spr_player_suplexdash;
							image_index = 0;
							shot = false;
							
							hsp = image_xscale * 8;
							particle_set_scale(part.jumpdust, image_xscale, 1);
							create_particle(x, y, part.jumpdust, 0);
						}
					}
				}
				else
					hsp = image_xscale * 6;
			}
			
			if (state == states.walk)
			{
				if (_grounded)
				{
					if (hsp != 0)
						sprite_index = walkspr;
					else
						sprite_index = idlespr;
				}
				else if (sprite_index != spr_player_jump && sprite_index != spr_player_fall)
					sprite_index = spr_player_fall;
				else if (sprite_index == spr_player_jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_player_fall;
				
				if (((!check_slope(x, y + 1) && (inst_front != noone || inst_up != noone)) || (inst_down == noone && inst_down2 == noone))
				&& targetplayer.y <= (y + 32) && _grounded && state != states.charge && jump) or jump == 2
				{
					vsp = -11;
					sprite_index = spr_player_jump;
					image_index = 0;
					
					if REMIX
					{
						particle_set_scale(part.highjumpcloud2, xscale, 1);
						create_particle(x, y, part.highjumpcloud2, 0);
						
						sound_play_3d(sfx_jump, x, y);
					}
				}
			}
		}
		else if heat
			hsp = Approach(hsp, 0, 0.5);
		break;
	
	case states.punch:
		if sprite_index == spr_pepclone_attack
		{
			hsp = Approach(hsp, 0, 1);
			if !shot && floor(image_index) > 14
			{
				if (!fmod_event_instance_is_playing(snd))
				{
					fmod_event_instance_play(snd);
					sound_instance_move(snd, x, y);
				}
				shot = true;
				hitboxID = instance_create(x, y, obj_forkhitbox);
				with (hitboxID)
				{
					ID = other.id;
					sprite_index = spr_weeniesquire_hitbox;
				}
			}
			if floor(image_index) > 23
				instance_destroy(hitboxID);
			
			if floor(image_index) == image_number - 1
			{
				state = states.walk;
				instance_destroy(hitboxID);
				cooldown = 100;
			}
		}
		else
		{
			if !shot
			{
				shot = true;
				hitboxID = instance_create(x, y, obj_forkhitbox);
				with hitboxID
				{
					ID = other.id;
					sprite_index = spr_weeniesquire_hitbox;
				}
			}
			
			image_speed = 0.4;
			if _grounded
			{
				if image_index > 7
					hsp = Approach(hsp, 0, 0.5);
				else
					hsp = Approach(hsp, max(12, abs(hsp)) * sign(obj_player1.x - x), 0.4);
			}
			else
				hsp = Approach(hsp, max(6, abs(hsp)) * sign(obj_player1.x - x), 0.2);
			
			if current_time % 6 == 0
				create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
			
			var air = sprite_index == spr_player_kungfuair1 or sprite_index == spr_player_kungfuair2 or sprite_index == spr_player_kungfuair3;
			if (!air && floor(image_index) == image_number - 1) or (air && _grounded)
			{
				state = states.walk;
				instance_destroy(hitboxID);
				cooldown = 50;
			}
		}
		break;
	
	case states.handstandjump:
		hsp = Approach(hsp, image_xscale * 10, 0.5);
		cooldown = 100;
		
		if current_time % 6 == 0
			create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
		
		if !grounded && sprite_index == spr_player_suplexdash
		{
			image_index = 0;
			sprite_index = spr_player_suplexgrabjumpstart;
		}
		if image_index >= image_number - 1 && sprite_index == spr_player_suplexgrabjumpstart
			sprite_index = spr_player_suplexgrabjump;
		
		var _parry = instance_place(x, y, obj_parryhitbox);
		if _parry
		{
			with _parry
				event_user(0);
		}
		else
		{
			var player = instance_place(x, y, obj_player);
			if player && player.state != states.actor && !player.cutscene
			{
				sound_stop(sfx_suplexdash, true);
			
				with player
				{
					state = states.actor;
					sprite_index = spr_hurt;
					image_speed = 0.35;
				}
			
				sprite_index = spr_player_haulingstart;
				if !grounded
					vsp = -6;
				state = states.grab;
				cooldown = 20;
				hsp = 0;
			}
			else if (image_index >= image_number - 1 && sprite_index == spr_player_suplexdash)
			or (_grounded && sprite_index == spr_player_suplexgrabjump)
				state = states.walk;
		}
		break;
	
	case states.grab:
		image_speed = 0.35;
		if floor(image_index) == image_number - 1
			sprite_index = _grounded ? spr_player_haulingidle : spr_player_haulingfall;
		if sprite_index == spr_player_haulingfall && _grounded
		{
			image_index = 0;
			sprite_index = spr_player_haulingland;
		}
		
		var xx = x, yy = y - 40;
		if sprite_index == spr_player_haulingstart
			yy = y - (floor(image_index) * 10);
		
		with obj_player1
		{
			hsp = 0;
			vsp = 0;
			state = states.actor;
			x = xx;
			y = yy;
		}
		
		if --cooldown <= 0
		{
			image_index = 0;
			sprite_index = choose(spr_player_finishingblow1, spr_player_finishingblow2, spr_player_finishingblow3, spr_player_finishingblow4, spr_player_finishingblow5);
			state = states.finishingblow;
		}
		break;
	
	case states.finishingblow:
		if current_time % 6 == 0
			create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
		
		if floor(image_index) < 4
			hsp = Approach(hsp, 0, 1);
		else
			hsp = Approach(hsp, -image_xscale * 4, 0.5);
		
		if image_index >= 4
		{
			if obj_player1.state == states.actor
			{
				with obj_player1
				{
					instance_create(x, y, obj_parryeffect);
					xscale = -other.image_xscale;
					
					sound_play_3d("event:/sfx/enemies/killingblow", x, y);
					sound_play_3d("event:/sfx/pep/punch", x, y);
					
					state = states.normal;
					cutscene = false;
					scr_hurtplayer(id);
					
					movespeed = 16;
					vsp = -8;
				}
				shake_camera(3, (3 / room_speed));
			}
		}
		else with obj_player1
		{
			vsp = 0;
			x = other.x + other.image_xscale * 60;
			y = other.y;
			
			while scr_solid(x, y)
				x -= other.image_xscale;
		}
		
		if floor(image_index) == image_number - 1
		{
			hsp = 0;
			state = states.walk;
			cooldown = 100;
		}
		break;
	
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
}
if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != states.stun)
	birdcreated = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state == states.stun && fmod_event_instance_is_playing(snd))
	fmod_event_instance_stop(snd, false);
if (state != states.grabbed)
	depth = 0;
if (state != states.stun)
	thrown = false;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
