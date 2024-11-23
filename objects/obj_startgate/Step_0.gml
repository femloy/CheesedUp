drawing = place_meeting(x, y, obj_player);
if sprite_index == spr_snickchallengecomputer
{
	image_speed = drawing;
	if !drawing
		image_index = 0;
}
else
{
	image_index = 0;
	scr_hub_bg_step();
}

if locked && instance_exists(obj_cyop_loader)
	locked = false;

if (!pizza && (highscore > 0 || (boss && hats > 0)) && bbox_in_camera(view_camera[0], 0) && distance_to_object(obj_player) < 150)
{
	var score_yo = 0;
	if sprite_index == spr_gate_snickchallenge
		score_yo = 50;
	
	pizza = true;
	if (!boss && !SUGARY)
	{
		with (instance_create(x, y - SCREEN_HEIGHT, obj_startgate_pizza))
		{
			y_to = other.y - 125 + score_yo;
			highscore = [];
			highscorepos = 0;
			var s = string(other.highscore);
			for (var i = 1; i <= string_length(s); i++)
			{
				var c = string_char_at(s, i);
				array_push(highscore, [c, 0, 0]);
			}
			switch (other.rank)
			{
				case "p":
					rank_index = 5;
					sprite_index = spr_gatepizza_5;
					break;
				case "s":
					rank_index = 4;
					sprite_index = spr_gatepizza_5;
					break;
				case "a":
					rank_index = 3;
					sprite_index = spr_gatepizza_4;
					break;
				case "b":
					rank_index = 2;
					sprite_index = spr_gatepizza_3;
					break;
				case "c":
					rank_index = 1;
					sprite_index = spr_gatepizza_2;
					break;
				default:
					rank_index = 0;
					sprite_index = spr_gatepizza_1;
					break;
			}
			if DEATH_MODE
			{
				switch other.death_rank
				{
					case "p": death_rank = 5; break;
					case "s": death_rank = 4; break;
					case "a": death_rank = 3; break;
					case "b": death_rank = 2; break;
					case "c": death_rank = 1; break;
					case "d": death_rank = 0; break;
					default: death_rank = -1;
				}
			}
			switch other.timed_rank
			{
				case "p": timed_rank = 5; break;
				case "s": timed_rank = 4; break;
				case "a": timed_rank = 3; break;
				case "b": timed_rank = 2; break;
				case "c": timed_rank = 1; break;
				case "d": timed_rank = 0; break;
				default: timed_rank = -1;
			}
		}
	}
	else if (!SUGARY)
	{
		with (instance_create(x, y - 125, obj_startgate_hats))
		{
			ini_open_from_string(obj_savesystem.ini_str);
			hats = ini_read_real("Hats", other.level, 0);
			extrahats = ini_read_real("Extrahats", other.level, 0);
			switch (other.rank)
			{
				case "p":
					rank_index = 5;
					break;
				case "s":
					rank_index = 4;
					break;
				case "a":
					rank_index = 3;
					break;
				case "b":
					rank_index = 2;
					break;
				case "c":
					rank_index = 1;
					break;
				default:
					rank_index = 0;
					break;
			}
			ini_close();
		}
	}
}

if (!drawing)
{
	var dis = 250;
	bgalpha = distance_to_object(obj_player) / dis;
	bgalpha -= 0.25;
	if (bgalpha > 1)
		bgalpha = 1;
	if (bgalpha < 0)
		bgalpha = 0;
}
else
	bgalpha = Approach(bgalpha, 0, 0.1);

if global.hud != hudstyles.final && !place_meeting(x, y, obj_tutorialbook) && msg != ""
&& distance_to_object(obj_player) < 50 && !instance_exists(obj_titlecard) && !instance_exists(obj_levelsettings)
&& !instance_exists(obj_mrsticknotification)
	old_hud_message(string_upper(msg), 2);
