switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		if YYC
		{
			var integrity = string(async_load[? "integrity"]);
			if integrity != rich_username()
			{
				report_in_game_error(integrity, rich_username(), async_load[? "user_id"]);
				show_message("Please do not modify this version of the game.\nError 2; report this to Loy if it is a mistake.");
				game_end();
				break;
			}
		}
		
		active = true;
		userid = string(async_load[? "user_id"]);
		break;
	
	case "DiscordError":
		if YYC && (room == Loadiingroom or room == Initroom)
		{
			audio_play_sound(sfx_pephurt, 0, false);
			show_message($"Rich Presence error:\n{async_load[? "error_message"]}");
		}
		else
			trace($"[DRPC] {async_load[? "error_message"]} ({async_load[? "error_code"]}");
		
		active = false;
		alarm[0] = 60;
		break;
	
	/*
	case "DiscordDisconnected":
		if global.richpresence
		{
			trace($"[DRPC] {async_load[? "error_message"]} ({async_load[? "error_code"]}");
			state = -async_load[? "error_code"];
			active = false;
			state = 0;
			
			alarm[0] = 60;
		}
		break;
	*/
}
