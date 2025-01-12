targetRoom = tower_finalhallway;
level = "exit";
sprite_index = spr_gate_exit;
bgsprite = spr_gate_exitBG;
title_index = 5;
title_sprite = spr_titlecards_title2;
titlecard_index = 15;
title_music = noone;

if !global.sandbox
{
	if gamesave_open_ini()
	{
		var _found = false;
		if ini_read_string("Game", "finalrank", "none") != "none"
			_found = true;
		gamesave_close_ini(false);
		if !_found
			instance_destroy();
	}
}

group_arr = ["hubgroup"];
