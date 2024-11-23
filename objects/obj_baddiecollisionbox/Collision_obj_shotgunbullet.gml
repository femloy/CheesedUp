if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.state != states.grabbed && baddieID.state != states.hit && !baddieID.invincible && baddieID.instantkillable)
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += 5 + floor(global.combo / heat_nerf);
		global.combotime = 60;
		global.heattime = 60;
	}
	else
		global.combotime = 60;
	if (!baddieID.elite || baddieID.elitehit <= 0)
	{
		if (baddieID.destroyable)
		{
			if (other.brick)
				notification_push(notifs.brick_killenemy, [room, baddieID.object_index]);
			instance_destroy();
			instance_destroy(baddieID);
		}
		if (other.object_index == obj_playernoisearrow || other.minigun)
			instance_destroy(other);
	}
	else
	{
		if (!baddieID.elite && other.brick)
			notification_push(notifs.brick_killenemy, [room, baddieID.object_index]);
		
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
