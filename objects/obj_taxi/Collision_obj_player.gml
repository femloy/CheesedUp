with (other)
{
	if (key_up && grounded && ((state == states.ratmount && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_taxidud) && !instance_exists(obj_fadeout) && state != states.taxi && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
	{
		with (other)
		{
			create_particle(x, y, part.genericpoofeffect);
			obj_player1.visible = false;
			obj_player1.sprite_index = obj_player1.spr_idle;
			obj_player1.hsp = 0;
			obj_player1.movespeed = 0;
			obj_player1.ratmount_movespeed = 0;
			obj_player1.vsp = 0;
			obj_player1.state = states.taxi;
			sound_play("event:/sfx/misc/taximove");
			playerid = obj_player1;
			move = true;
			sprite_index = spr_taximove;
			hsp = 10;
			obj_player1.cutscene = true;
			depth = -100;
			
			with (obj_hamkuffattack)
			{
				if (state == 0)
					instance_destroy();
			}
			
			if (police)
			{
				with (instance_create(x, y, obj_taxicardboard))
					depth = -101;
				sound_play("event:/sfx/misc/policesiren");
				police_buffer = 50;
				obj_player1.policetaxi = true;
				sprite_index = spr_taxicop;
			}
			if (global.coop == 1)
			{
				obj_player2.sprite_index = obj_player2.spr_idle;
				sound_play("event:/sfx/misc/taximove");
				playerid = obj_player2;
				sprite_index = spr_taximove;
				hsp = 10;
				obj_player2.visible = false;
				obj_player2.hsp = 0;
				obj_player2.vsp = 0;
				obj_player2.state = states.taxi;
				obj_player2.cutscene = true;
			}
		}
	}
}
