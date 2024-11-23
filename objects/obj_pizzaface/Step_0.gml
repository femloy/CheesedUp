live_auto_call;

var playerid = obj_player1;
if obj_player1.spotlight == 0
	playerid = obj_player2;

if sprite_index == spr_haywire
{
	fmod_event_instance_stop(snd, true);
	
	if !fmod_event_instance_is_playing(slow_snd)
		fmod_event_instance_play(slow_snd);
	sound_instance_move(slow_snd, x, y);
}
else
{
	fmod_event_instance_stop(slow_snd, true);
	
	if mode == -1 or sprite_index == spr_idle
	{
		if !fmod_event_instance_is_playing(snd)
			fmod_event_instance_play(snd);
		sound_instance_move(snd, x, y);
	}
	else
		fmod_event_instance_stop(snd, true);
}
if !instance_exists(playerid)
	exit;

var _move = !frozen;
var lap_hell = check_lap_mode(lapmodes.laphell) && global.laps >= 2;

with obj_player
{
	if (state == states.taxi || state == states.victory || state == states.keyget || state == states.gottreasure || state == states.door || state == states.spaceshuttle)
	or (state == states.comingoutdoor && place_meeting(x, y, obj_exitgate)) or room == timesuproom
		_move = false;
	
	if lap_hell && sprite_index == spr_playerN_rocketstart
		image_index = min(image_index, image_number - 6);
}

// disable death
if DEATH_MODE && mode > -1
{
	if lap_hell or global.modifier_failed
		mode = -1;
}

// move
if !treasure
{
	if image_alpha >= 1
	{
		if DEATH_MODE && mode > -1
		{
			var has_time = instance_exists(obj_deathmode) && obj_deathmode.time > 0;
			if sprite_index == spr_todocile or sprite_index == spr_toangry
	        {
				if image_index >= image_number - 1
				{
		            image_index = 0;
		            sprite_index = mode ? spr_idle : spr_docile;
				}
	        }
	        else if has_time && mode == 1
	        {
				mode = 0;
				
	            image_index = 0;
	            sprite_index = spr_todocile;
	            flash = true;
			
				/*
	            with (create_debris(x, y, 4013))
	                image_index = 2
	            with (create_debris((x + 20), y, 4013))
	                image_index = 3
	            with (create_debris((x - 20), y, 4013))
	                image_index = 4
	            with (create_debris(x, (y + 30), 4013))
	                image_index = 5
				*/
	        }
	        else if !has_time && mode == 0
	        {
				mode = 1;
			
	            image_index = 0;
	            sprite_index = spr_toangry;
	            flash = true;
			
				/*
	            with (create_debris(x, y, 3124))
	                image_index = 0
	            with (create_debris(x, (y + 30), 3124))
	                image_index = 1
				*/
	        }
			
			var mvsp = maxspeed + (abs(obj_player1.hsp) / 8)
			var multiplier = 1
			
			if obj_deathmode.time > 0 mvsp *= 0.44
			else if obj_deathmode.time <= 0 mvsp *= 1.75
			
			var hamkuff_nerf = false
			with obj_hamkuff
			{
				if state == states.blockstance
					hamkuff_nerf = true
			}
	
			if hamkuff_nerf
				multiplier = 0.2
			else if playerid.state == states.cheesepep || playerid.state == states.cheesepepjump || playerid.state == states.cheesepepstickside || playerid.state == states.cheesepepstick multiplier = 0.75
				mvsp *= multiplier
			
			var turnspd = mvsp / 50
			if !bbox_in_camera(view_camera[0], 100)
			{
				mvsp *= 1.75
				turnspd *= 2.5
			}
			
			if (playerid.state == states.firemouth && playerid.sprite_index == playerid.spr_firemouthintro)
				_move = false;
			if playerid.cutscene
				_move = false;
			
			// distance_to_object(playerid) >= 1200 ? mvsp / 10 : (mvsp / 50)
			var inradius = point_in_circle(x, y, playerid.x, playerid.y, 250)
			var dir = point_direction(x, y, playerid.x + playerid.hsp, playerid.y + playerid.vsp)
			var next_pos = point_direction(x, y, x + hsp, y + vsp)
			
			switch state
			{
				case states.chase:
					if !_move
					{
						mvsp = 0
						turnspd = 0.3	
					}
			
					hsp = Approach(hsp, lengthdir_x(mvsp, dir), turnspd)
					vsp = Approach(vsp, lengthdir_y(mvsp, dir), turnspd)
					if inradius && !end_turn
					{
						state = states.turning
						saved_angle = dir
						if (saved_angle - 10 <= next_pos && saved_angle + 10 >= next_pos)
							state = states.chase
					}
					else if !inradius
						end_turn = 0
					x += hsp
					y += vsp
					break;
				
				case states.turning:
					hsp = Approach(hsp, 0, turnspd)
					vsp = Approach(vsp, 0, turnspd)
					if abs(hsp) <= 0 && abs(vsp) <= 0
					{
						state = states.chase
						end_turn = 1
					}
					x += hsp
					y += vsp
					break;
			}
		}
		else
		{
			if sprite_index == spr_pizzaface_spawn
				sprite_index = spr_idle;
			if !instance_exists(obj_fadeout) && !obj_player1.cutscene
			{
				if _move
				{
					var dir = point_direction(x, y, playerid.x, playerid.y);
					x += lengthdir_x(maxspeed, dir);
					y += lengthdir_y(maxspeed, dir);
				}
			}
			if maxspeed < 3
				maxspeed += 0.01;
		}
	}
	else if _move
	{
		image_alpha += 0.01;
		if image_index >= 8 && !laugh_sound && sprite_index == spr_pizzaface_spawn
		{
			laugh_sound = true;
			sound_play("event:/sfx/pizzaface/laugh");
		}
	}
	if !_move && mode == -1
		image_alpha = Approach(image_alpha, 0, 0.1);
}
else
{
	x = -200;
	y = -200;
}

if flash && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;

if _move && image_alpha >= 1
{
	var _parry = instance_place(x, y, obj_parryhitbox);
	if _parry && !_parry.collisioned && mode == -1 && global.parrypizzaface && !global.modifier_failed
	{
		if playerid.x != x
			playerid.xscale = sign(x - playerid.x);
		
		global.combotime = 60;
		global.heattime = 60;
		
		instance_create(x, y, obj_flash);
		global.fill += calculate_panic_timer(0, 10);
		with _parry
			event_user(0);
		instance_destroy();
	}
	else if place_meeting(x, y, playerid) && !playerid.cutscene && playerid.state != states.actor && !instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade)
	{
		fmod_event_instance_stop(snd, true);
		if instance_exists(obj_toppinwarrior)
		{
			if (variable_global_exists("toppinwarriorid1") && instance_exists(global.toppinwarriorid1))
				instance_destroy(global.toppinwarriorid1);
			else if (variable_global_exists("toppinwarriorid2") && instance_exists(global.toppinwarriorid2))
				instance_destroy(global.toppinwarriorid2);
			else if (variable_global_exists("toppinwarriorid3") && instance_exists(global.toppinwarriorid3))
				instance_destroy(global.toppinwarriorid3);
			else if (variable_global_exists("toppinwarriorid4") && instance_exists(global.toppinwarriorid4))
				instance_destroy(global.toppinwarriorid4);
			else if (variable_global_exists("toppinwarriorid5") && instance_exists(global.toppinwarriorid5))
				instance_destroy(global.toppinwarriorid5);
			
			instance_create(x, y, obj_flash);
			global.fill = (60 * 60) / 0.2;
			instance_destroy();
		}
		else if !instance_exists(obj_toppinwarrior)
		{
			with (playerid)
			{
				instance_destroy(obj_fadeout);
				targetDoor = "A";
				scr_room_goto(timesuproom);
				state = states.timesup;
				sprite_index = spr_Timesup;
				image_index = 0;
				if (isgustavo)
					sprite_index = spr_ratmount_timesup;
				visible = true;
				image_blend = c_white;
				stop_music();
			}
			instance_destroy(id, !REMIX);
			instance_destroy(obj_wartimer);
				
			if REMIX
			{
				sound_play_3d("event:/sfx/misc/explosion", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
				sound_play_3d("event:/sfx/pep/groundpound", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
			}
		}
	}
}
if (REMIX or global.laps >= 2) && !instance_exists(tracker) && !treasure
{
	tracker = instance_create(0, 0, obj_objecticontracker);
	tracker.objectID = id;
	switch sprite_index
	{
		default: tracker.sprite_index = spr_icon_pizzaface; break;
		case spr_coneball: tracker.sprite_index = spr_icon_coneball; break;
		case spr_pizzaface_bo: tracker.sprite_index = spr_icon_pizzabo; break;
	}
}
if DEATH_MODE && mode > -1
{
	with tracker
	{
		if other.mode == 0
			sprite_index = spr_icon_pizzagooch;
		if other.mode == 1
			sprite_index = spr_icon_pizzaface;
	}
}
if keyboard_check_pressed(ord("F")) && DEBUG
	frozen = !frozen;

/*
if keyboard_check_pressed(ord("R"))
{
	instance_destroy(id, false);
	instance_create(x, y, obj_pizzaface);
	scr_pizzaface_laugh();
}
*/
