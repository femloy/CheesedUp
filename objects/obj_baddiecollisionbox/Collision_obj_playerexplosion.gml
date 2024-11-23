if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.state != states.grabbed && !baddieID.invincible && baddieID.instantkillable)
{
	if (room == boss_pizzaface && (baddieID.object_index == obj_pepperman || baddieID.object_index == obj_vigilanteboss || baddieID.object_index == obj_noiseboss || baddieID.object_index == obj_fakepepboss || baddieID.object_index == obj_pizzafaceboss_p3))
	{
		other.baddiegrabbedID = baddieID;
		with baddieID
		{
			grabbedby = 1;
			scr_boss_grabbed();
		}
	}
	else
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
	}
}
