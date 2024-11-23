if instance_exists(obj_genericdeath)
	exit;

var v = id;
with (other)
{
	if (state != states.Sjump && state != states.gotoplayer && state != states.actor)
	{
		var dir = other.image_yscale;
		if flip < 0
			dir *= -1;
		
		if (state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes)
		{
			var i = 0;
			repeat 5
			{
				with (instance_create(x, y, obj_knightdebris))
					image_index = i++;
			}
		}
		if (state == states.bombpep)
			instance_create(x, y, obj_bombexplosion);
		x = other.x;
		
		if (dir == 1)
			instance_create(x, y - 20, obj_bangeffect);
		if (dir == 1)
		{
			sprite_index = spr_superspringplayer;
			state = states.Sjump;
			vsp = -10;
		}
		else
		{
			state = states.freefall;
			vsp = 10;
			sprite_index = spr_rockethitwall;
		}
		if (dir == -1)
		{
			if ((other.sprite_index == spr_bottle_idle || other.sprite_index == spr_bottle_activate) && !other.bottlepop)
			{
				other.bottlepop = true;
				repeat (5)
					instance_create(other.x, other.y + 40, obj_bubbles);
				sound_play_3d("event:/sfx/misc/bottlepop", x, y);
			}
		}
		with (instance_create(x, y, obj_speedlinesup))
		{
			playerid = other.id;
			image_yscale = v.image_yscale;
		}
		other.image_index = 0;
		if (other.sprite_index != other.activatespr)
			sound_play_3d("event:/sfx/misc/superspring", x, y);
		other.sprite_index = other.activatespr;
	}
}
