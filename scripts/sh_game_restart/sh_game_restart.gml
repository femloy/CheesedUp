function sh_game_restart()
{
	if global.processing_mod == noone
		game_restart();
}
function meta_game_restart()
{
	return
	{
		description: "restarts the game",
	}
}
