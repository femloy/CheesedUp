if (used)
	image_index = 1;
else
	image_index = 0;

var s = 16;
if place_meeting(x, y - s, obj_player) && !collision_point(x + sprite_width + image_xscale * 32, y - 32, obj_solid, true, false)
{
	with (obj_player)
	{
		var by = 4;
		if (state == states.mach3 or (state == states.ratmount && ratmount_movespeed >= 12))
			by = 10;
		
		var bx = 8;
		if (state == states.mach3 || state == states.ratmounttumble || (state == states.ratmount && ratmount_movespeed >= 12))
			bx = 18;
		
		if ((state == states.mach2 || (state == states.ratmount && ratmount_movespeed > 8) || state == states.ratmounttumble || state == states.trashroll || state == states.tumble || state == states.mach3 || state == states.trickjump || state == states.ratmounttrickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, y + s, other))
		{
			vsp = -12;
			movespeed = 14;
			if (sprite_index != spr_rampjump && sprite_index != spr_ratmount_walljump)
			{
				sound_play("event:/sfx/pep/rampjump");
				sprite_index = spr_rampjump;
				image_index = 0;
				if (character == "N")
					image_speed = 2;
			}
			if (isgustavo)
			{
				sprite_index = spr_ratmount_walljump;
				state = states.ratmounttrickjump;
			}
			else
				state = states.trickjump;
			if (!other.used)
			{
				ramp = true;
				other.used = true;
			}
			ramp_buffer = 16;
			//trace("trickjump");
		}
	}
}
