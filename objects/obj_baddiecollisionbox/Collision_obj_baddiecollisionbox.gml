if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.object_index != obj_pizzafaceboss && !baddieID.thrown && !other.baddieID.mach3destroy && baddieID.state != states.hit && other.baddieID.thrown && other.baddieID.state != states.hit && baddieID.killbyenemybuffer <= 0 && baddieID.killbyenemy && baddieID != other.baddieID && baddieID.state != states.grabbed && !baddieID.invincible && baddieID.instantkillable && ((/*global.attackstyle != 2 && */!global.kungfu) || baddieID.hp <= 0) && !global.kungfu)
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += 5 + floor(global.combo / heat_nerf);
		global.combotime = 60;
		global.heattime = 60;
	}
	var lag = 5;
	if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
	{
		scr_hitstun_enemy(baddieID, lag, -other.baddieID.image_xscale * 15, -8);
		baddieID.hp -= 1;
		instance_create(baddieID.x, baddieID.y, obj_parryeffect);
		baddieID.image_xscale = other.baddieID.image_xscale;
		repeat 3
		{
			create_slapstar(x, y);
			create_baddiegibs(x, y);
		}
		shake_camera(3, 3 / room_speed);
		baddieID.killbyenemybuffer = 10;
		baddieID.grabbedby = 0;
		if (instance_exists(other.baddieID))
			other.baddieID.killbyenemybuffer = 10;
		if (baddieID.destroyable && (!baddieID.elite || baddieID.elitehit <= 0))
			instance_destroy(baddieID);
	}
}
