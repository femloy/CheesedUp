with instance_place(x, y, obj_dynamite)
{
	instance_destroy();
	instance_create(x, y, obj_explosion);
}

if instance_exists(obj_genericdeath)
	exit;

var playerid = instance_place(x, y - 1, obj_player);
with (playerid)
{
	if (state != states.boots && state != states.dead && state != states.rideweenie && state != states.gotoplayer)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		if (state != states.fireass && state != states.swimming)
			notification_push(notifs.boilingsauce, [room]);
		
		if character == "V"
		{
			if y >= other.bbox_top - 10 or vsp >= 0
			{
				if state != states.swimming
				{
					movespeed = hsp;
					sprite_index = spr_playerV_swimidle;
					image_index = 0;
				
					if vsp >= 0
					{
						sound_play("event:/sfx/misc/watersplash");
						vsp = clamp(vsp, 6, 14);
						
						with instance_create(x, other.bbox_top - 10, obj_parryeffect)
						{
							sprite_index = spr_bloodsplash;
							depth = 102;
						}
					}
				}
				state = states.swimming;
				burning = 1;
			}
		}
		else
		{
			GamepadSetVibration(_pindex, 1, 1, 0.85);
			state = states.fireass;
			vsp = -20 * flip;
			if !instance_exists(obj_cyop_loader)
				vsp *= sign(other.image_yscale);
			fireasslock = false;
			sprite_index = spr_fireass;
			image_index = 0;
			movespeed = hsp;
			
			sound_play_3d("event:/sfx/pep/burn", x, y);
			if !fmod_event_instance_is_playing(global.snd_fireass)
				fmod_event_instance_play(global.snd_fireass);
		}
	}
}
