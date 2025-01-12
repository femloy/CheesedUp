live_auto_call;

music = noone;
fade = 1;

start = false;
target_x = 0;
target_y = 0;
target_time = 0;

con = 0;
con_time = 0;
elevator_x = 0;
elevator_y = 0;

with obj_camera
	followtarget = other.id;

if gamesave_open_ini()
{
	ini_write_real("Game", "elevator", true);
	gamesave_close_ini(true);
	gamesave_async_save();
}
