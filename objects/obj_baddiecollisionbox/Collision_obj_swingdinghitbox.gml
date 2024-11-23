if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.state != states.grabbed && !baddieID.invincible && baddieID.instantkillable)
{
	baddieID.invtime = 25;
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += 5 + floor(global.combo / heat_nerf);
		global.combotime = 60;
		global.heattime = 60;
	}
	
	var lag = 8;
	baddieID.hp -= 1;
	instance_create(baddieID.x, baddieID.y, obj_parryeffect);
	baddieID.image_xscale = -other.image_xscale;
	repeat 3
	{
		create_slapstar(x, y);
		create_baddiegibs(x, y);
	}
	shake_camera(3, 3 / room_speed);
	scr_hitstun_enemy(baddieID, lag, other.image_xscale * 15, -8);
}
