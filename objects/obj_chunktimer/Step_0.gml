if (!PANIC or global.tutorial_room or (DEATH_MODE && MOD.DeathMode) or global.timeattack)
&& !(global.lapmode == LAP_MODES.laphell && global.laps >= 2)
	exit;
if room == timesuproom or room == rank_room or instance_exists(obj_endlevelfade)
	exit;

if global.fill > 0
	global.fill -= 0.2;
else
{
	global.fill = 0;
	if !instance_exists(obj_pizzaface)
	{
		var s = string_letters(room_get_name(room));
		var tower = string_copy(s, 1, 5) == "tower" or global.tutorial_room;
		
		if (!tower or global.lapmode == LAP_MODES.laphell) && !global.snickchallenge
		{
			instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
			scr_pizzaface_laugh();
		}
		else
		{
			instance_destroy(obj_snickexe);
			with obj_player1
			{
				instance_destroy(obj_fadeout);
				targetDoor = "A";
				scr_room_goto(timesuproom);
				state = states.timesup;
				sprite_index = spr_Timesup;
				image_index = 0;
				if tower
				{
					backtohubroom = tower_finalhallway;
					backtohubstartx = 206;
					backtohubstarty = 690;
				}
				if isgustavo
					sprite_index = spr_ratmount_timesup;
				visible = true;
				image_blend = c_white;
				if object_index == obj_player1 && character != "N" && !global.swapmode
					stop_music();
			}
			with obj_camera
				alarm[1] = -1;
		}
	}
}
