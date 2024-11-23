live_auto_call;

with death
{
	visible = false;
	alarm[0] = -1;
	alarm[1] = -1;
}

with obj_player
{
	if character != "G" && y >= room_height - 50
		vsp = -16;
	global.combotimepause = 10;
}

// resetting
var trickytreat = instance_exists(obj_pumpkincounter);
if global.leveltorestart != noone or trickytreat
{
	var checkpoint = is_struct(global.checkpoint_data);
	if instance_exists(obj_genericfade)
	{
		// restart
		if obj_genericfade.fade >= 1
		{
			instance_destroy();
			if trickytreat
			{
				with obj_player
				{
					targetRoom = trickytreat_1;
					targetDoor = "D";
					state = states.comingoutdoor;
					image_index = 0;
				}
				with obj_music
					music = noone;
				scr_room_goto(trickytreat_1);
			}
			else if checkpoint
				load_checkpoint();
			else with obj_pause
			{
				roomtorestart = global.leveltorestart;
				event_perform(ev_alarm, 5);
			}
		}
	}
	else if ++t >= 220
	{
		if t == 220
			scr_pizzaface_laugh(true);
				
		// back to hub
		if (t - 220) >= 150
		{
			with obj_player
			{
				state = states.dead;
				y = room_height * 3;
			}
		}
	}
	else
	{
		if !instance_exists(obj_transfotip)
		{
			with create_transformation_tip(checkpoint ? lstr("deathcheckpoint") : lstr("deathrestart"), noone, true, true)
				depth = other.depth - 1;
		}
		if obj_player1.key_taunt2
		{
			with instance_create(0, 0, obj_genericfade)
			{
				persistent = true;
				depth = other.depth - 1;
				fade = 0;
			}
		}
	}
}
with obj_backtohub_fadeout
{
	fadealpha = 1;
	instance_destroy(other);
}
