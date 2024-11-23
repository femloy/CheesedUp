instance_destroy(instance_place(x, y - 1, obj_baddie));
with instance_place(x, y - 1, obj_player)
{
	if instance_exists(obj_genericdeath)
		break;
	
	if (state != states.golf && state != states.tackle && state != states.gotoplayer && state != states.stringfall && state != states.stringjump && state != states.stringfling)
	{
		if (place_meeting(x, y + flip, other))
		{
			if (state != states.trashjump && state != states.trashroll)
			or (character == "N" && sprite_index != spr_playercorpsesurf && sprite_index != spr_playercorpsestart)
			{
				if !instance_exists(obj_surfback) || character != "N"
				{
					if (state != states.barrel && state != states.barreljump && state != states.barrelslide && state != states.barrelclimbwall)
					{
						if (state != states.slipnslide || sprite_index != spr_currentplayer)
							sound_play_3d("event:/sfx/misc/waterslidesplash", x, y);
						state = states.slipnslide;
						sprite_index = spr_currentplayer;
					}
					else
					{
						state = states.barrelslide;
						if (sprite_index != spr_barrelslipnslide)
							sprite_index = spr_barrelroll;
					}
					xscale = sign(other.image_xscale);
					movespeed = 20;
				}
				else if state != states.slipnslide
				{
					sound_play_3d("event:/sfx/misc/waterslidesplash", x, y);
					movespeed = 15;
					state = states.slipnslide;
				}
			}
			else
			{
				sound_play_3d("event:/sfx/misc/waterslidesplash", x, y);
				with (instance_create(x, y, obj_slidecloud))
				{
					image_xscale = other.xscale;
					sprite_index = spr_watereffect;
				}
				vsp = -6;
				image_index = 0;
				if (state == states.trashjump)
				{
					state = states.trashroll;
					movespeed = abs(movespeed);
					dir = xscale;
					movespeed += 3;
					particle_set_scale(part.jumpdust, REMIX ? xscale : 1, 1);
					create_particle(x, y, part.jumpdust);
					sprite_index = spr_player_trashslide;
				}
			}
		}
	}
}
with instance_place(x, y - 1, obj_brickball)
{
	if check_char("G") or REMIX
	{
		movespeed = 20;
		image_xscale = sign(other.image_xscale);
	}
}
