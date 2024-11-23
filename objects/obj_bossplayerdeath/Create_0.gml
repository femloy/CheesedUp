live_auto_call;

with (obj_player1)
{
	state = states.actor;
	image_index = 0;
	
	switch character
	{
		default:
		case "P":
			sprite_index = spr_player_outofpizza1;
			deathspeed = 10;
			vsp = -12;
			break;
			
		case "N":
			fmod_event_instance_set_parameter(snd_bossdeathN, "state", 0, true);
			scr_fmod_soundeffect(snd_bossdeathN, x, y);
			sprite_index = spr_playerN_bossdeath1;
			targetvsp = vsp;
			deathbuffer = 50;
			vsp = -7;
			deathspeed = 16;
			break;
		
		case "V":
			sprite_index = spr_hurt;
			image_speed = 0.35;
			deathspeed = 8;
			vsp = -14;
			break;
		
		case "G":
			with obj_camera
				lock = true;
			sound_play("event:/modded/sfx/gusdead");
			sprite_index = spr_lonegustavo_deathstart;
			image_speed = 0.5;
			roomstartx = x;
			roomstarty = y;
			deathspeed = 0;
			hsp = 0;
			vsp = 0;
			deathbuffer = room_speed * 0.5;
			shaketime = 10;
			
			var brick_x = x, brick_y = y;
			with obj_brickcomeback
			{
				brick_x = x;
				brick_y = y;
				instance_destroy(id, false);
			}
			with obj_brickball
			{
				brick_x = x;
				brick_y = y;
				instance_destroy(id, false);
			}
			
			sound_play_3d(sfx_killenemy, x, y);
			with instance_create(brick_x - xscale, brick_y, obj_sausageman_dead)
				sprite_index = spr_lonebrick_hurt;
			break;
	}
}
with (obj_playerbomb)
{
	dead = true;
	deadbuffer = 0;
	instance_destroy();
}
depth = -600;
fade = 0;
fade2 = 0;
fade2start = false;
state = states.jump;

particles = [];
draw_particles = function()
{
	pal_swap_player_palette();
	for(var i = 0; i < array_length(particles); i++)
	{
		with particles[i]
		{
			x += hsp;
			y += vsp;
		
			if collision_point(x, y + vsp + 1, obj_solid, 0, false)
			or collision_point(x, y + vsp + 1, obj_slope, 0, false)
			or collision_line(x, y, x, y + vsp + 1, obj_platform, 0, false)
			{
				if vsp > 2
				{
					vsp *= -0.5;
				
					var inst = sound_play_3d("event:/modded/playerV/step", x, y);
					fmod_event_instance_set_pitch(inst, random_range(0.75, 1.25));
					fmod_event_instance_set_volume(inst, min(abs(vsp / 10), 1));
				}
				else
					vsp = 0;
			
				hsp = Approach(hsp, 0, 0.5);
			}
			else
				vsp += 0.5;
		
			angle -= hsp * 2;
		
			if collision_point(x + hsp, y, obj_solid, 0, false)
			or collision_point(x + hsp, y, obj_slope, 0, false)
				hsp *= -1;
			
			draw_sprite_ext(spr_playerV_gibs, image, x - CAMX, y - CAMY, 1, 1, angle, c_white, 1);
		}
	}
	pal_swap_reset();
}

if global.jukebox != noone
	exit;
stop_music();
