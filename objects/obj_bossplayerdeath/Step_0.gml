live_auto_call;

/*
if keyboard_check_pressed(ord("R"))
{
	obj_player.y = CAMY + CAMH / 2 + 50;
	event_perform(ev_create, 0);
}
*/

fade = Approach(fade, 1, 0.03);
if fade2start
	fade2 = Approach(fade2, 1, 0.06);
with obj_player1
{
	image_speed = 0.35;
	switch character
	{
		case "P":
		default:
			switch other.state
			{
				case states.jump:
					if (sprite_index == spr_player_outofpizza1 && floor(image_index) == (image_number - 1))
						sprite_index = spr_player_outofpizza2;
					hsp = deathspeed * -xscale;
					if (check_solid(x + sign(hsp), y))
					{
						sound_play_3d("event:/sfx/pep/groundpound", x, y);
						xscale *= -1;
						instance_create(x + (xscale * 20), y, obj_bangeffect);
					}
					if (grounded && vsp > 0)
					{
						image_index = 0;
						sprite_index = spr_player_outofpizza3;
						other.state = states.normal;
						other.alarm[0] = 200;
						other.alarm[2] = 150;
					}
					break;
		
				case states.normal:
					if (sprite_index == spr_player_outofpizza3 && floor(image_index) == (image_number - 1))
						sprite_index = spr_player_outofpizza4;
					hsp = deathspeed * -xscale;
					deathspeed = Approach(deathspeed, 0, 0.1);
					break;
			}
			break;
		
		case "N":
			switch other.state
			{
				case states.jump:
					if (sprite_index == spr_playerN_bossdeath1 && floor(image_index) == image_number - 1)
						sprite_index = spr_playerN_bossdeath1loop;
					hsp = deathspeed * -xscale;
					vsp = targetvsp;
					if (place_meeting(x + sign(hsp), y, obj_solid))
					{
						sound_play_3d("event:/sfx/pep/bump", x, y);
						xscale *= -1;
						instance_create(x + (xscale * 20), y, obj_bumpeffect);
					}
					targetvsp = lerp(targetvsp, -1, 0.15);
					deathspeed = Approach(deathspeed, 0.5, 0.25);
					if (abs(hsp) <= 5)
					{
						if deathbuffer > 0
							deathbuffer--;
						else
						{
							vsp = -3;
							fmod_event_instance_set_parameter(snd_bossdeathN, "state", 1, true);
							other.state = states.fall;
							sprite_index = spr_playerN_bossdeath2;
							image_index = 0;
						}
					}
					break;
			
				case states.fall:
					vsp += 0.5;
					if floor(image_index) == image_number - 1
						image_index = image_number - 1;
					if grounded && vsp > 0
					{
						hsp = 0;
						other.state = states.normal;
						other.alarm[0] = 100;
						other.alarm[2] = 50;
					}
					break;
			
				case states.normal:
					if floor(image_index) == image_number - 1
						image_index = image_number - 1;
					break;
			}
			break;
		
		case "V":
			switch other.state
			{
				case states.jump:
					hsp = deathspeed * -xscale;
					if floor(image_index) >= image_number - 1
					{
						image_index = 0;
						deathspeed--;
						if deathspeed <= 6
						{
							sprite_index = spr_playerV_bossdeath;
							image_index = 0;
							other.state = states.bombpep;
						}
					}
					break;
				
				case states.bombpep:
					hsp = Approach(hsp, 0, .25);
					vsp = Approach(vsp, 0, .25);
					
					if image_index >= 10
					{
						sound_play_3d(sfx_explosion, x, y);
						other.state = states.normal;
						other.alarm[0] = 200;
						other.alarm[2] = 150;
						
						with other
						{
							var new_gib = function(x, y, image)
							{
								array_push(particles, {
									x: x, y: y, hsp: random_range(-8, 8), vsp: random_range(-8, -14), angle: random_range(0, 360),
									image: image
								});
							}
							
							new_gib(other.x, other.y, 0);
							new_gib(other.x, other.y, 4);
							new_gib(other.x, other.y, 5);
							
							repeat 20
								new_gib(other.x, other.y, choose(1, 2, 3, 6, 7, 8));
						}
					}
					break;
				
				case states.normal:
					hsp = 0;
					vsp = 0;
					
					if image_index >= image_number - 1
						image_index = image_number - 1;
					break;
			}
			break;
		
		case "G":
			shaketime = Approach(shaketime, 0, 0.5);
			switch other.state
			{
				case states.jump:
					image_speed = 0;
					if --deathbuffer <= 0
					{
						state = -1;
						other.state = states.fall;
						deathspeed = -15;
						
						other.alarm[0] = 200;
						other.alarm[2] = 150;
					}
					break;
				
				case states.fall:
					roomstarty += deathspeed;
					deathspeed = Approach(deathspeed, 20, grav);
					
					if deathspeed >= 3 && sprite_index == spr_lonegustavo_deathstartidle
					{
						image_index = 0;
						sprite_index = spr_lonegustavo_deathend;
					}
					break;
			}
			x = roomstartx + random_range(-shaketime, shaketime);
			y = roomstarty + random_range(-shaketime, shaketime);
			vsp = 0;
			
			if sprite_index == spr_lonegustavo_deathstart
			{
				image_speed = 0.5;
				if image_index >= image_number - 1
					sprite_index = spr_lonegustavo_deathstartidle;
			}
			if sprite_index == spr_lonegustavo_deathend && image_index >= image_number - 1
				sprite_index = spr_lonegustavo_deathendidle;
			break;
	}
}
