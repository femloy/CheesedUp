if (instance_exists(baddieID) && baddieID.stun == 1 && (other.state == states.handstandjump || other.state == states.punch || other.instakillmove == 1))
{
	with (other)
	{
		sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
		image_index = 0;
		state = states.tackle;
		movespeed = 3;
		vsp = -3;
		instance_destroy(other);
	}
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	instance_create(x, y, obj_bangeffect);
	instance_destroy(baddieID);
	instance_destroy();
}
