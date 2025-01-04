function scr_ratblock_destroy()
{
	with instance_place(x, y, obj_canonexplosion)
	{
		instance_destroy(other);
		if baddie
			notification_push(notifs.ratblock_explode, [room]);
	}
	with obj_player
	{
		if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
		&& sprite_index == spr_tumble && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other))
			instance_destroy(other);
		
		else if character == "V" && (other.object_index == obj_rattumble or other.object_index == obj_ratblock1x1)
		&& state == states.tumble && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other))
			instance_destroy(other);
		
		else if burning
		{
			if distance_to_object(other) <= 24
				instance_destroy(other);
		}
		
		else if distance_to_object(other) <= 1
		{
			if state != states.mort && state != states.bombgrab && (!scr_transformationcheck() || state == states.barrel || (character == "S" && abs(movespeed) > 12) || state == states.ratmountbounce)
			{
				switch (state)
				{
					case states.barrel:
						if (!place_meeting(x, y - 12, other))
							instance_destroy(other);
						break;
					case states.boxxedpepspin:
						vsp = -6;
						if (character == "N")
						{
							sprite_index = spr_playerN_boxxedhit;
							image_index = 0;
						}
						instance_destroy(other);
						break;
					case states.bombpep:
						if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
						{
							instance_create(x, y, obj_bombexplosion);
							instance_destroy(other);
							GamepadSetVibration(0, 1, 1, 0.9);
							hurted = true;
							vsp = -4;
							image_index = 0;
							sprite_index = spr_bombpepend;
							state = states.bombpep;
							bombpeptimer = 0;
						}
						break;
					case states.gotoplayer:
					case states.tube:
					case states.actor:
					case states.boxxedpep:
					case states.mort:
					case states.morthook:
					case states.mortjump:
					case states.boxxedpepjump:
					case states.knightpep:
					case states.knightpepbump:
						break;
					case states.ratmountbounce:
						if place_meeting(x, y + vsp + 1, other) && character != "N"
							instance_destroy(other);
						break;
					case states.tumble:
						if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
							instance_destroy(other);
						break;
					default:
						if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
							instance_destroy(other);
						break;
				}
			}
		}
	}
}
