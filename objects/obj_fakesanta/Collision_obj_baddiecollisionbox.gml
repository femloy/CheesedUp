var baddieID = id;
if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.thrown != 1 && !other.baddieID.mach3destroy && baddieID.state != states.hit && other.baddieID.thrown == 1 && other.baddieID.state != states.hit)
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += (5 + floor(global.combo / heat_nerf));
		global.combotime = 60;
		global.heattime = 60;
	}
	
	var lag = 5;
	if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
	{
		baddieID.hp -= 1;
		
		instance_create(baddieID.x, baddieID.y, obj_parryeffect);
		baddieID.image_xscale = other.baddieID.image_xscale;
		
		repeat 3
		{
			create_slapstar(x, y);
			create_baddiegibs(x, y);
		}
		shake_camera(3, 3 / room_speed);
		scr_hitstun_enemy(baddieID, lag, -other.baddieID.image_xscale * 15, -8);
		
		baddieID.killbyenemybuffer = 10;
		other.baddieID.killbyenemybuffer = 10;
		if (baddieID.destroyable && (!baddieID.elite || baddieID.elitehit <= 0))
			instance_destroy(baddieID);
	}
}
