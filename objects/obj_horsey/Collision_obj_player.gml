if ((sprite_index == spr_horsey_win || sprite_index == spr_horsey_lose) && other.character == "N" && (other.instakillmove == true || other.state == states.handstandjump || other.state == states.mach2))
{
	var t = other.id;
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	sound_play_3d("event:/sfx/playerN/horseydead", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	global.combotime = 60;
	instance_create(x, y, obj_bangeffect);
	instance_create(x, y, obj_genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_horsey_lose;
		hsp = t.xscale * 10;
	}
	instance_destroy();
	instance_destroy(obj_horseyblock);
}
