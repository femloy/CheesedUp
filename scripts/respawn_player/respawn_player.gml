function respawn_player()
{
	with obj_player1
	{
		if room != Mainmenu && room != tower_outside && room != Realtitlescreen && room != Longintro && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom && room != rank_room
		{
			with instance_nearest(x, y, obj_checkpoint_invis)
				event_user(0);
			
			shake_camera(3, 3 / room_speed);
			if (state == states.ghostpossess)
			{
				state = states.ghost;
				sprite_index = spr_ghostidle;
			}
			var s = state;
			notification_push(notifs.fall_outofbounds, [id, s]);
			state = states.actor;
			visible = false;
			hsp = 0;
			sound_play_3d(sfx_groundpound, x, room_height - 100);
			with instance_create(x, y + 540, obj_technicaldifficulty)
				playerid = other.id
			vsp = 10;
		}
		else
		{
			state = states.titlescreen;
			x = -100;
			y = -100;
		}
	}
}