if (playerid.visible == 0)
{
	global.hp = 8;
	global.failcutscene = false;
	with (obj_player1)
	{
		sound_play("event:/sfx/misc/taxibeep");
		state = states.normal;
		create_particle(x, y, part.genericpoofeffect);
		cutscene = false;
		if (isgustavo)
		{
			state = states.ratmount;
			sprite_index = spr_ratmount_idle;
		}
	}
	if (global.coop == 1)
	{
		with (obj_player2)
		{
			state = states.normal;
			cutscene = false;
			if (isgustavo)
				state = states.ratmount;
		}
	}
	obj_player1.visible = true;
	obj_player2.visible = true;
}
