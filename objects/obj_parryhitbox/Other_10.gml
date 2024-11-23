var myplayer = obj_player1.id;
if (player_id == 2)
	myplayer = obj_player2.id;
if (myplayer.state != states.hurt)
{
	with (myplayer)
	{
		parry_lethal = other.lethal;
		if (state != states.parry)
		{
			sound_instance_move(global.snd_parry, x, y);
			fmod_event_instance_play(global.snd_parry);
		}
		state = states.parry;
		if (!isgustavo)
			sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
		else
			sprite_index = spr_ratmount_spit;
		image_index = 0;
		image_speed = 0.35;
		taunttimer = 20;
		movespeed = 8;
		parry_inst = noone;
		parry_count = parry_max;
		with (instance_create(x, y, obj_parryeffect))
			image_xscale = other.xscale;
		flash = true;
	}
	alarm[0] = die_time;
	collisioned = true;
}
