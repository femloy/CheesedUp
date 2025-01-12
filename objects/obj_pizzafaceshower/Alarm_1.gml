start = true;
if obj_player1.x > x
	instance_destroy();

if !global.sandbox && gamesave_open_ini()
{
	if ini_read_real("Game", "shower", false)
		instance_destroy();
	gamesave_close_ini(false);
}
else
	instance_destroy();
