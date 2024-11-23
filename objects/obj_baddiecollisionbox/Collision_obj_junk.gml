if (instance_exists(baddieID) && baddieID.state != states.hit && baddieID.invtime == 0 && other.thrown == 1 && !baddieID.invincible && (baddieID.object_index != obj_noiseboss || (other.object_index != obj_pepjunk || !other.noisethrow)) && baddieID.destroyable)
{
	if (baddieID.destroyable && (!baddieID.elite || baddieID.elitehit <= 0))
	{
		instance_destroy();
		instance_destroy(baddieID);
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
