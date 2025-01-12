pal_swap_init_system(shd_pal_swapper);
gameframe_caption_text = lang_get_value("caption_ending");

if gamesave_open_ini()
{
	if ini_read_string("Game", "finalrank", "none") == "none"
		notification_push(notifs.firsttime_ending, [room]);
	gamesave_close_ini(false);
}
