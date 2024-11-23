if (instance_exists(baddieID) && other.target == baddieID && baddieID.invtime == 0 && baddieID.state != 4 && !baddieID.invincible && baddieID.instantkillable)
{
	baddieID.invtime = 15;
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if !baddieID.important
	{
		global.style += (5 + global.combo);
		global.combotime = 60;
		global.heattime = 60;
	}
	var lag = 2;
	baddieID.mach3destroy = true;
	baddieID.hp -= 1;
	instance_create(baddieID.x, baddieID.y, obj_parryeffect);
	if baddieID.x != other.x
		baddieID.image_xscale = sign(other.x - baddieID.x);
	else
		baddieID.image_xscale = -other.image_xscale;
	repeat 3
	{
		create_slapstar(x, y);
		create_baddiegibs(x, y);
	}
	shake_camera(3, 3 / room_speed);
	baddieID.invtime = 30;
	scr_hitstun_enemy(baddieID, lag, -baddieID.image_xscale * 22, -4);
	with other
	{
		repeat 3
			instance_create(x, y, obj_firemouthflame);
		instance_destroy();
	}
}
