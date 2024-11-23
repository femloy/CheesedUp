if (other.team == 1 && instance_exists(baddieID) && baddieID.parryable && baddieID.state != states.grabbed && baddieID.state != states.hit && !baddieID.invincible && baddieID.instantkillable)
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += 5 + floor(global.combo / heat_nerf);
		global.combotime = 60;
		global.heattime = 60;
	}
	if (!baddieID.elite || baddieID.elitehit <= 0)
	{
		if (baddieID.destroyable)
		{
			notification_push(notifs.baddie_hurtboxkill, [room, baddieID.object_index, baddieID, other.object_index]);
			instance_destroy(baddieID);
			instance_destroy();
		}
	}
	else
	{
		var lag = 2;
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
}
