state = np_initdiscord(string(1101168015841693736), true, np_steam_app_id_empty);
active = false;
character = "";
userid = "";

if YYC
{
	#macro ___ (obj_richpresence)
	if !state
	{
		show_message("Failed to start Discord Rich Presence.\nThis is an anti-leaking measure.");
		game_end();
	}
}
