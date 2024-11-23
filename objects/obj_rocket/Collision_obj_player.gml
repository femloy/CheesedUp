if (buffer > 0)
	exit;
if instance_exists(obj_genericdeath)
	exit;

with other
{
	if other.playerid == noone && state != states.rocket && state != states.actor && state != states.rocketslide && state != states.gotoplayer
	{
		if character == "V"
		{
			if grounded
			{
				sound_play_3d(sfx_collecttoppin, x, y);
				tauntstoredstate = states.normal;
				state = states.animation;
				sprite_index = spr_playerV_rocketget;
				image_index = 0;
				image_speed = 0.35;
				global.vigiweapon = vweapons.rocket;
				instance_destroy(other);
				create_transformation_tip(lstr("rockettipV"), "rocketV", , true);
			}
		}
		else
		{
			xscale = other.image_xscale;
			state = states.rocket;
			other.playerid = id;
			other.buffer = 10;
			if (character != "N")
				create_transformation_tip(lang_get_value("rockettip"), "rocket");
			else
				create_transformation_tip(lang_get_value("rockettipN"), "rocketN");
			sprite_index = SUGARY ? spr_rocketbottle_start : spr_rocketstart;
			image_index = 0;
			if (movespeed < 8)
				movespeed = 8;
			x = other.x;
			y = other.y + 4;
		}
	}
}
