if (playerid.visible == 0)
{
	jumpbuffer = 15;
	start = true;
	with (obj_player1)
	{
		sound_play("event:/sfx/misc/taxibeep");
		if (isgustavo)
		{
			state = states.ratmount;
			sprite_index = spr_ratmount_idle;
		}
		else
			state = states.normal;
		create_particle(x, y, part.genericpoofeffect);
		movespeed = 0;
		ratmount_movespeed = 0;
		cutscene = false;
	}
	if (global.coop == 1)
	{
		with (obj_player2)
		{
			state = states.normal;
			cutscene = false;
		}
	}
	obj_player1.visible = true;
	obj_player2.visible = true;
}
