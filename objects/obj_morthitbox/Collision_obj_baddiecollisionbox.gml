if (instance_exists(other.baddieID) && !other.baddieID.invincible && other.baddieID.destroyable && playerid.state != states.chainsaw && other.baddieID.state != states.hit && !other.baddieID.thrown)
{
	with (other)
	{
		sound_play_3d("event:/sfx/pep/punch", x, y);
		sound_play_3d("event:/sfx/mort/mortslap", x, y);
		
		var lag = 5;
		baddieID.mach3destroy = true;
		baddieID.hp -= 1;
		instance_create(baddieID.x, baddieID.y, obj_parryeffect);
		baddieID.image_xscale = -other.image_xscale;
		repeat 3
		{
			create_slapstar(x, y);
			create_baddiegibs(x, y);
		}
		shake_camera(3, 3 / room_speed);
		scr_hitstun_enemy(baddieID, lag, other.image_xscale * 10, -4);
	}
	Mort_DownMovement();
}
