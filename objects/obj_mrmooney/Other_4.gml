var unlocked = true;
var stickunlocked = true;

if !global.sandbox && gamesave_open_ini()
{
	var w = "w5stick";
	var unlocked = ini_read_real(w, "mooneyunlocked", false);
	var stickunlocked = ini_read_real(w, "unlocked", false);
	gamesave_close_ini(false);
}

if !unlocked && stickunlocked
{
	if global.pigtotal - global.pigreduction >= maxscore
	{
		with instance_create(0, 0, obj_mrsticknotification)
		{
			sprite_index = spr_mrmooney_notification;
			if obj_player1.character == "N" || global.swapmode
				sprite_index = spr_noisetterabbitTV;
		}
	}
}
else
	instance_destroy();
