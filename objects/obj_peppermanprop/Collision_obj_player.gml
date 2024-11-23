if (other.instakillmove || other.state == states.handstandjump || other.state == states.mach2)
{
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	sound_play_3d("event:/sfx/voice/peppermanscared", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	add_baddieroom();
	instance_create(x, y, obj_bangeffect);
	create_particle(x, y, part.genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -other.image_xscale;
		sprite_index = spr_pepperman_scared;
		hsp = other.image_xscale * 10;
	}
	instance_destroy();
}
