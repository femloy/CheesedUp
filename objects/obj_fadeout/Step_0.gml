var f = 1;
if (group_arr != noone or cyop_level != "")
	f = 1.2;

if (fadealpha > f)
{
	var q = false;
	if (!fadein)
	{
		q = true;
		with obj_camera
			lock = false;
		if (gamestart or (instance_exists(obj_cyop_loader) && obj_cyop_loader.gamestart))
		{
			with obj_cyop_loader
				gamestart = false;
			
			ini_open_from_string(obj_savesystem.ini_str);
			global.file_minutes = ini_read_real("Game", "minutes", 0);
			global.file_seconds = ini_read_real("Game", "seconds", 0);
			ini_close();
		}
		if (restarttimer)
		{
			global.level_minutes = 0;
			global.level_seconds = 0;
		}
	}
	if (finalhallway)
	{
		with (obj_player)
		{
			state = states.normal;
			movespeed = 0;
			landAnim = false;
			hallway = true;
			hallwaydirection = 1;
			targetDoor = "C";
		}
	}
	
	fadein = true;
	if (q && (group_arr != noone or cyop_level != ""))
	{
		instance_destroy(obj_pigtotal);
		with (instance_create(0, 0, obj_loadingscreen))
		{
			dark = true;
			group_arr = other.group_arr;
			offload_arr = other.offload_arr;
			persistent = true;
			
			cyop_level = other.cyop_level;
		}
	}
	else
	{
		event_perform(ev_alarm, 0);
		if (q && offload_arr != noone)
		{
			trace($"[obj_fadeout] Flushing textures: {offload_arr}");
			for (var i = 0, n = array_length(offload_arr); i < n; ++i)
				texture_flush(offload_arr[i]);
		}
	}
}

if alarm[0] == -1 && !instance_exists(obj_loadingscreen)
{
	if (fadein == 0)
		fadealpha += 0.1;
	else if (fadein == 1)
		fadealpha -= 0.1;
}

if (instance_exists(obj_player))
{
	with (obj_player1)
	{
		if (other.fadein == 1 && (state == states.door || state == states.victory) && ((sprite_index == spr_victory or sprite_index == spr_ratmountvictory) || place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate) || (place_meeting(x, y, obj_exitgate) && instance_exists(obj_cyop_loader)) || place_meeting(x, y, obj_hubelevator)))
		{
			state = states.comingoutdoor;
			image_index = 0;
		}
		if (other.fadein == 1 && state == -1)
		{
			state = states.comingoutdoor;
			image_index = 0;
			visible = true;
		}
		if (other.fadein == 1 && state == states.door && box)
		{
			if isgustavo
				state = states.ratmountcrouch;
			else if character == "S"
				state = states.normal;
			else
			{
				state = states.crouchjump;
				uncrouch = 20;
			}
		}
	}
}
if (fadein == 1 && fadealpha < 0)
	instance_destroy();
