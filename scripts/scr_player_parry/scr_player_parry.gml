function scr_player_parry()
{
	if (image_index > (image_number - 1))
	{
		state = states.normal;
		if (tauntstoredisgustavo)
			state = states.ratmount;
	}
	hsp = -xscale * movespeed;
	image_speed = 0.5;
	if (movespeed > 0)
		movespeed -= 0.5;
	var _grabbedby = 1;
	if (object_index == obj_player2)
		_grabbedby = 2;
	if (parry_count > 0 && parry_lethal)
	{
		parry_count--;
		var parry_threshold = 84;
		with (obj_baddie)
		{
			if ((other.parryID == id || distance_to_object(other) <= parry_threshold) && state != states.hit && state != states.grabbed && state != states.stun && parryable && !(state == states.stun && thrown == 1))
			{
				notification_push(notifs.parry, [id, object_index, room]);
				grabbedby = _grabbedby;
				
				var lag = 5;
				scr_hitstun_enemy(id, lag, other.xscale * 25, 0);
				linethrown = true;
				image_xscale = -other.xscale;
				
				if (!important)
				{
					global.combotime = 60;
					global.heattime = 60;
				}
				/*
				with other
					scr_hitstun_player(lag);
				*/
				
				if (!elite || elitehit <= 0)
					mach3destroy = true;
				instance_create(x, y, obj_parryeffect);
				alarm[3] = 1;
				
				repeat 3
				{
					create_slapstar(x, y);
					create_baddiegibs(x, y);
				}
				shake_camera(3, 3 / room_speed);
				stunned = 100;
				other.hithsp = -other.image_xscale * 6;
				other.hsp = -other.image_xscale * 6;
				if (!other.grounded)
				{
					other.vsp = -6;
					other.hitvsp = -6;
				}
			}
		}
	}
}
